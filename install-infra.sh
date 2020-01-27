#!/bin/sh

# Create namespaces for Strimzi and Kafka
kubectl create ns strimzi
kubectl create ns kafka

# Install Strimzi Helm chart
helm repo add strimzi https://strimzi.io/charts
helm install strimzi strimzi/strimzi-kafka-operator -n strimzi --set watchNamespaces={kafka} --wait --timeout 300s

# Install Strimzi custom resource, and wait for cluster creation
kubectl apply -f kafka-strimzi.yml -n kafka
kubectl wait --for=condition=Ready kafkas/my-cluster -n kafka --timeout 180s

# Create namespace for Postgres
kubectl create ns postgres

# TODO - is this required outside of OpenShift?
kubectl create serviceaccount -n postgres pgserviceaccount

# Install Postgres Helm chart
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm install postgresql stable/postgresql -n postgres --wait --timeout=300s --set postgresqlPassword=supersecret --set persistence.enabled=false --set serviceAccount.enabled=true --set serviceAccount.name=pgserviceaccount
