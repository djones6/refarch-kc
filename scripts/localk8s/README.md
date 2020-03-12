# Deployment to local Kubernetes

The scripts in the `scripts/localk8s` directory can be used to deploy the refarch-kc microservices and backing services to a local Kubernetes cluster.

## Installation

The entire installation process can be run by executing the `install.sh` or `install.bat` script. This script will invoke:
- `install-infra.sh` to set up the Kafka and Postgres backing services,
- `install-app.sh` to configure the configmaps, Kafka topics and secrets, and deploy the microservices,
- `run-integration-tests.sh` to execute the integration tests against the deployment as a Kubernetes job.

If desired, these steps can each be run individually by running the appropriate script.

### Namespaces

During the installation, a set of namespaces will be created to hold the components:
- `strimzi` to hold the Strimzi operator,
- `kafka` to hold the Kafka cluster that Strimzi will create for us,
- `postgres` to hold the Postgres operator and DB instance,
- `shipping` to hold the application microservices and configuration.

### Infrastructure

The infrastructure set up by `install-infra.sh` consists of:
- The Strimzi Kafka Operator, installed using Helm, configured to watch the `kafka` namespace,
- A Kafka cluster named `my-cluster`, with a single replica, ephemeral storage, and no TLS,
- A ServiceAccount called `pgserviceaccount`,
- The Bitnami Postgresql Helm chart

## Uninstalling

The entire solution can be uninstalled by executing the `uninstall.sh` or `uninstall.bat` script. Similar to installation, this will invoke:
- `uninstall-app.sh` to 
