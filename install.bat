:: Create namespaces for Strimzi and Kafka
kubectl create ns strimzi
kubectl create ns kafka

:: Install Strimzi Helm chart
helm repo add strimzi https://strimzi.io/charts
helm install strimzi strimzi/strimzi-kafka-operator -n strimzi --set watchNamespaces={kafka} --wait --timeout 300s

:: Install Strimzi custom resource, and wait for cluster creation
kubectl apply -f kafka-strimzi.yml -n kafka
kubectl wait --for=condition=Ready kafkas/my-cluster -n kafka --timeout 180s

:: Create namespace for Postgres
kubectl create ns postgres

:: TODO - is this only an OpenShift concern?
kubectl create serviceaccount -n postgres pgserviceaccount

:: Install Postgres Helm chart
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm install postgresql stable/postgresql -n postgres --set postgresqlPassword=supersecret --set persistence.enabled=false --set serviceAccount.enabled=true --set serviceAccount.name=pgserviceaccount

:: Configure secrets to allow microservices to connect to Postgres
kubectl create secret generic postgresql-url --from-literal=binding="jdbc:postgresql://postgresql.postgres.svc" -n shipping
kubectl create secret generic postgresql-user --from-literal=binding="postgres" -n shipping
kubectl create secret generic postgresql-pwd --from-literal=binding="supersecret" -n shipping

:: Create namespace for refarch-kc microservices
kubectl create ns shipping

:: Create a configmap to allow microservices to find Kafka
kubectl create configmap kafka-brokers --from-literal=brokers="my-cluster-kafka-bootstrap.kafka.svc" -n shipping
:: or: kubectl apply -f kafka-brokers.yaml

:: Create Kafka topics
kubectl apply -f topics.yaml

:: call postinstall.bat
