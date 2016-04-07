#!/bin/bash
/rabbitmq/sbin/rabbitmq-server&

# Capture the PID
rmq_pid=$!

sleep 1
/rabbitmq/sbin/rabbitmqctl add_user admin admin
/rabbitmq/sbin/rabbitmqctl set_user_tags admin administrator
/rabbitmq/sbin/rabbitmqctl set_permissions admin ".*" ".*" ".*"

wait $rmq_pid 2> /dev/null