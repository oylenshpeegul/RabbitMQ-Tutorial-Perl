#!/usr/bin/env perl

use v5.24;
use warnings;
use experimental qw(signatures);
use Memoize;
use Net::AMQP::RabbitMQ;
memoize('fib');

my $mq = Net::AMQP::RabbitMQ->new();

$mq->connect('localhost', { user => 'guest', password => 'guest' });

$mq->channel_open(1);

$mq->queue_declare(1, 'rpc_queue');

$mq->basic_qos(1, {prefetch_count => 1});

$mq->consume(1, 'rpc_queue');

say ' [*] Awaiting RPC requests';
while (1) {

	my $received = $mq->recv(0);
	my $response = fib($received->{body});
	say " [.] fib($received->{body}) is $response";

	$mq->publish(
		1,
		$received->{props}{reply_to},
		$response,
		undef,
		{
			correlation_id => $received->{props}{correlation_id},
			delivery_mode => 2,
		},
	);
}

sub fib($n) {
	return $n if $n == 0 or $n == 1;
	return fib($n-1) + fib($n-2);
}

