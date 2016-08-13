#!/usr/bin/env perl

use v5.24;
use warnings;
use experimental qw(signatures);
use Net::AMQP::RabbitMQ;

my $mq = Net::AMQP::RabbitMQ->new();

$mq->connect('localhost', { user => 'guest', password => 'guest' });

$mq->channel_open(1);

$mq->queue_declare(1, 'task_queue', {durable => 1});

$mq->basic_qos(1, {prefetch_count => 1});

$mq->consume(1, 'task_queue', {no_ack => 0});

say ' [*] Waiting for messages. To exit press CTRL-C';
while (1) {

	my $received = $mq->recv(0);
	do_work($received->{body});
	$mq->ack(1, $received->{delivery_tag})

}

sub do_work($body) {
	say " [x] Received '$body'";
	sleep ($body =~ tr/\.//);
	say " [x] Done '$body'";
}	
