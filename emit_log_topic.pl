#!/usr/bin/env perl

use v5.24;
use warnings;
use Net::AMQP::RabbitMQ;

my $routing_key = shift // 'anonymous.info';
my $message = "@ARGV" || 'Hello, World!';

my $mq = Net::AMQP::RabbitMQ->new;

$mq->connect('localhost', { user => 'guest', password => 'guest' });

$mq->channel_open(1);

$mq->exchange_declare(
	1,
	'topic_logs',
	{
		exchange_type => 'topic',
		durable => 1,
	},
);

$mq->publish(
	1,
	$routing_key,
	$message,
	{exchange => 'topic_logs'},
	{delivery_mode => 2},
);

say " [x] Sent '$routing_key: $message' ";

$mq->disconnect;
