#!/bin/sh

# Uninstall microservices
helm uninstall kc-ui -n shipping
helm uninstall order-command-ms -n shipping
helm uninstall order-query-ms -n shipping
helm uninstall spring-container-ms -n shipping
helm uninstall voyages-ms -n shipping
helm uninstall fleet-ms -n shipping

# Remove Kafka topics
kubectl delete -f topics.yaml

# Delete Postgres secrets
kubectl delete secret postgresql-url -n shipping
kubectl delete secret postgresql-user -n shipping
kubectl delete secret postgresql-pwd -n shipping

# Delete Kafka configmap
kubectl delete configmap kafka-brokers -n shipping

# TODO - is this required outside of OpenShift?
kubectl delete serviceaccount -n shipping kcserviceaccount

# Delete refarch-kc microservices namespace
kubectl delete ns shipping
