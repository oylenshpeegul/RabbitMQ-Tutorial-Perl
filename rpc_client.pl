#!/usr/bin/env perl

use v5.24;
use warnings;
use Net::AMQP::RabbitMQ;
use UUID::Tiny;

my $message = shift // 1;

my $mq = Net::AMQP::RabbitMQ->new;

$mq->connect('localhost', { user => 'guest', password => 'guest' });

$mq->channel_open(1);

$mq->queue_declare(1, 'rpc_queue');

$mq->basic_qos(1, {prefetch_count => 1});

my $callback_queue = $mq->queue_declare(1, '', {exclusive => 1});

$mq->consume(1, $callback_queue);

my $correlation_id = UUID::Tiny::create_uuid_as_string(UUID::Tiny::UUID_V4);

$mq->publish(
	1,
	'rpc_queue',
	$message,
	undef,
	{
		reply_to => $callback_queue,
		correlation_id => $correlation_id,
		delivery_mode => 2,
	},
);

say " [x] Sent '$message' ";

while (1) {
	my $received = $mq->recv(0);
	if ($received->{props}{correlation_id} eq $correlation_id) {
		say " [x] Received '$received->{body}'";
		last;
	}
}

$mq->disconnect;
