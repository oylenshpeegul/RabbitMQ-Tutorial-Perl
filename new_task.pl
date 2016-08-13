#!/usr/bin/env perl

use v5.24;
use warnings;
use Net::AMQP::RabbitMQ;

my $mq = Net::AMQP::RabbitMQ->new;

$mq->connect('localhost', { user => 'guest', password => 'guest' });

$mq->channel_open(1);

$mq->queue_declare(1, 'hello');
	
$mq->publish(1, 'hello', 'Hello, World!');

say " [x] Sent 'Hello World!' ";

$mq->disconnect;
