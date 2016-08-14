# RabbitMQ-Tutorial-Perl

The RabbitMQ tutorial at http://www.rabbitmq.com/getstarted.html doesn't include Perl. There is one at https://github.com/rabbitmq/rabbitmq-tutorials/tree/master/perl, but it uses [Net::RabbitFoot](http://p3rl.org/Net::RabbitFoot), which doesn't work with Perl 5.24. It looks like [Net::AMQP::RabbitMQ](http://p3rl.org/Net::AMQP::RabbitMQ) is the most up-to-date Perl module for RabbitMQ, so I'm going to try doing the tutorial with that.

1. [Hello world](http://www.rabbitmq.com/tutorials/tutorial-one-python.html)
  * [send.pl](https://github.com/oylenshpeegul/RabbitMQ-Tutorial-Perl/blob/master/send.pl)
  * [receive.pl](https://github.com/oylenshpeegul/RabbitMQ-Tutorial-Perl/blob/master/receive.pl)
2. [Work queues](http://www.rabbitmq.com/tutorials/tutorial-two-python.html)
  * [new\_task.pl](https://github.com/oylenshpeegul/RabbitMQ-Tutorial-Perl/blob/master/new_task.pl)
  * [worker.pl](https://github.com/oylenshpeegul/RabbitMQ-Tutorial-Perl/blob/master/worker.pl)
3. [Publish/Subscribe](http://www.rabbitmq.com/tutorials/tutorial-three-python.html)
4. [Routing](http://www.rabbitmq.com/tutorials/tutorial-four-python.html)
5. [Topics](http://www.rabbitmq.com/tutorials/tutorial-five-python.html)
6. [RPC](http://www.rabbitmq.com/tutorials/tutorial-six-python.html)

