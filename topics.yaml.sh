#!/bin/bash

TOPICS="bluewaterContainer
bluewaterShip
bluewaterProblem
orders
orderCommands
rejected-orders
allocated-orders
errors
containers
containerMetrics
reeferTelemetries"

echo -n "" > topics.yaml
for TOPIC in $TOPICS; do
    TOPICLC=`echo $TOPIC | tr '[:upper:]' '[:lower:]'`
    cat topics.yaml.template | sed -e"s#  name: \$#  name: ${TOPICLC}#" -e"s#  topicName: \$#  topicName: ${TOPIC}#" >> topics.yaml
    echo "---" >> topics.yaml
done
