#!/usr/bin/env perl

use v5.24;
use warnings;
use Net::AMQP::RabbitMQ;

my $severity = shift // 'info';
my $message = "@ARGV" || 'Hello, World!';

my $mq = Net::AMQP::RabbitMQ->new;

$mq->connect('localhost', { user => 'guest', password => 'guest' });

$mq->channel_open(1);

$mq->exchange_declare(
	1,
	'direct_logs',
	{
		exchange_type => 'direct',
		durable => 1,
	},
);

$mq->publish(
	1,
	$severity,
	$message,
	{exchange => 'direct_logs'},
	{delivery_mode => 2},
);

say " [x] Sent '$severity: $message' ";

$mq->disconnect;
