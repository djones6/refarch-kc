:: Uninstall order-command-ms
helm uninstall order-command-ms -n shipping

:: Remove Kafka topics
kubectl delete -f topics.yaml

:: Delete Postgres secrets
kubectl delete secret postgresql-url -n shipping
kubectl delete secret postgresql-user -n shipping
kubectl delete secret postgresql-pwd -n shipping

:: Delete Kafka configmap
kubectl delete configmap kafka-brokers -n shipping

:: Uninstall Postgres Helm chart
helm uninstall postgresql -n postgres

:: TODO - is this required outside of OpenShift?
kubectl delete serviceaccount -n postgres pgserviceaccount
kubectl delete serviceaccount -n shipping kcserviceaccount

:: Delete refarch-kc microservices namespace
kubectl delete ns shipping

:: Delete Postgres namespace
kubectl delete ns postgres

:: Delete Kafka cluster
kubectl delete -f kafka-strimzi.yml -n kafka

:: Uninstall Strimzi Helm chart
helm uninstall strimzi -n strimzi

:: Remove Strimzi and Kafka namespaces
kubectl delete ns strimzi
kubectl delete ns kafka
