#!/usr/bin/env perl

use v5.24;
use warnings;
use Net::AMQP::RabbitMQ;

my $message = shift // 'info: Hello, World!';

my $mq = Net::AMQP::RabbitMQ->new;

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

$mq->publish(
	1,
	'',
	$message,
	{exchange => 'logs'},
	{delivery_mode => 2},
);

say " [x] Sent '$message' ";

$mq->disconnect;
