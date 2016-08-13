#!/usr/bin/env perl

use v5.24;
use warnings;
use Net::AMQP::RabbitMQ;

my $message = shift // 'Hello, World!';

my $mq = Net::AMQP::RabbitMQ->new;

$mq->connect('localhost', { user => 'guest', password => 'guest' });

$mq->channel_open(1);

$mq->queue_declare(1, 'task_queue', {durable => 1});

$mq->publish(1, 'task_queue', $message, undef, {delivery_mode => 2});

say " [x] Sent '$message' ";

$mq->disconnect;
