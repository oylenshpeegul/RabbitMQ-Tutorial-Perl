#!/usr/bin/env perl

use v5.24;
use warnings;
use Net::AMQP::RabbitMQ;

STDOUT->autoflush(1);

my $mq = Net::AMQP::RabbitMQ->new();

$mq->connect('localhost', { user => 'guest', password => 'guest' });

$mq->channel_open(1);

$mq->exchange_declare(
	1,
	'logs',
	{
		exchange_type => 'fanout',
		durable => 1,
	},
);

my $queue_name = $mq->queue_declare(1, '', {exclusive => 1});

$mq->queue_bind(1, $queue_name, 'logs', '');

warn ' [*] Waiting for logs. To exit press CTRL-C';

$mq->consume(1, $queue_name);

while (1) {
	my $received = $mq->recv(0);
	say " [x] $received->{body}";
}
