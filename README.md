# RabbitMQ-Tutorial-Perl

The RabbitMQ tutorial at http://www.rabbitmq.com/getstarted.html doesn't include Perl. There is one at https://github.com/rabbitmq/rabbitmq-tutorials/tree/master/perl, but it uses [Net::RabbitFoot](http://p3rl.org/Net::RabbitFoot), which doesn't work with Perl 5.24. It looks like [Net::AMQP::RabbitMQ](http://p3rl.org/Net::AMQP::RabbitMQ) is the most up-to-date Perl module for RabbitMQ, so I'm going to try doing the tutorial with that.

1. [Hello world](http://www.rabbitmq.com/tutorials/tutorial-one-python.html)
  * [send.pl](send.pl)
  * [receive.pl](receive.pl)
2. [Work queues](http://www.rabbitmq.com/tutorials/tutorial-two-python.html)
  * [new\_task.pl](new_task.pl)
  * [worker.pl](worker.pl)
3. [Publish/Subscribe](http://www.rabbitmq.com/tutorials/tutorial-three-python.html)
  * [emit\_log.pl](emit_log.pl)
  * [receive\_logs.pl](receive_logs.pl)
4. [Routing](http://www.rabbitmq.com/tutorials/tutorial-four-python.html)
  * [emit\_log\_direct.pl](emit_log_direct.pl)
  * [receive\_logs\_direct.pl](receive_logs_direct.pl)
5. [Topics](http://www.rabbitmq.com/tutorials/tutorial-five-python.html)
  * emit\_log_topic.pl
  * receive\_logs_topic.pl
6. [RPC](http://www.rabbitmq.com/tutorials/tutorial-six-python.html)
  * rpc_server.pl
  * rpc_client.pl

