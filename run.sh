#!/bin/bash
/rabbitmq/sbin/rabbitmq-server&

# Capture the PID
rmq_pid=$!

RABBITMQ_ADMIN_PASSWORD=${RABBITMQ_ADMIN_PASSWORD:-"admin"}
RABBITMQ_ADMIN_LOGIN=${RABBITMQ_ADMIN_LOGIN:-"admin"}

sleep 5
/rabbitmq/sbin/rabbitmqctl add_user ${RABBITMQ_ADMIN_LOGIN} ${RABBITMQ_ADMIN_PASSWORD}
/rabbitmq/sbin/rabbitmqctl set_user_tags ${RABBITMQ_ADMIN_LOGIN} administrator
/rabbitmq/sbin/rabbitmqctl set_permissions ${RABBITMQ_ADMIN_LOGIN} ".*" ".*" ".*"

wait $rmq_pid 2> /dev/null