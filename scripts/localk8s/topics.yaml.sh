#!/bin/bash
SCRIPTLOC="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TOPICS="bluewater-container
bluewater-ship
bluewater-problem
orders
order-commands
rejected-orders
allocated-orders
errors
containers
reefer-telemetry
container-anomaly-retry
container-anomaly-dead"

echo -n "" > $SCRIPTLOC/topics.yaml
for TOPIC in $TOPICS; do
    TOPICLC=`echo $TOPIC | tr '[:upper:]' '[:lower:]'`
    cat $SCRIPTLOC/topics.yaml.template | sed -e"s#  name: \$#  name: ${TOPICLC}#" -e"s#  topicName: \$#  topicName: ${TOPIC}#" >> topics.yaml
    echo "---" >> $SCRIPTLOC/topics.yaml
done
