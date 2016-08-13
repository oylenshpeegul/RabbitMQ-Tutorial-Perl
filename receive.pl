#!/usr/bin/env perl

use v5.24;
use warnings;
use Net::AMQP::RabbitMQ;

my $mq = Net::AMQP::RabbitMQ->new();

$mq->connect('localhost', { user => 'guest', password => 'guest' });

$mq->channel_open(1);

$mq->queue_declare(1, 'hello');

$mq->consume(1, 'hello');

say ' [*] Waiting for messages. To exit press CTRL-C';
while (1) {
	my $received = $mq->recv(0);
	say " [x] Received '$received->{body}'";
}
