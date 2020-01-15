:: Delete shipping namespace
kubectl delete ns shipping

:: Uninstall Postgres Helm chart
helm uninstall postgresql -n postgres

:: Delete namespace for Postgres
kubectl delete ns postgres

:: Delete Kafka cluster
kubectl delete -f kafka-strimzi.yml -n kafka

:: Uninstall Strimzi Helm chart
helm uninstall strimzi -n strimzi

:: Delete namespaces for Strimzi and Kafka
kubectl delete ns strimzi
kubectl delete ns kafka
