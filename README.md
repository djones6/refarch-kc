# Reefer Container Shipment solution - EDA reference implementation

The IBM Event Driven architecture reference implementation solution illustrates the deployment of real time analytics on event streams in the context of container shipment in an [event driven architecture](https://ibm-cloud-architecture.github.io/refarch-eda) with event backbone, functions as service and evnt-driven microservices, and aims to illustrate the different event driven patterns like event sourcing, CQRS and Saga. There is a lot of content, so consider this to be a living book, for better reading experience go to [the book view.](http://ibm-cloud-architecture.github.io/refarch-kc)

## TL;DR

If you want to just get the code, build and run we propose running locally with Minikube or Docker-compose. 

To build and run the solution locally we are delivering some scripts which should help you to quickly get the solution cloned, built and deployed. Those bash scripts are under the `scripts` folder of this project.

```
git clone https://github.com/ibm-cloud-architecture/refarch-kc.git
```

```
cd refarch
./scripts/clone.sh
```

* To assess your environment and build the docker images needed for build: 

```
./scripts/prepareEnv
```

For docker-compose we recommend reading [this note](http://ibm-cloud-architecture.github.io/refarch-kc/deployments/local/) for Minikube [this separate note](http://ibm-cloud-architecture.github.io/refarch-kc/deployments/minikube/)

### Running in a local Kubernetes environment

The following scripts will deploy the application components and backing services to an arbitrary k8s cluster, which could be a local one such as Docker Desktop, Minikube etc.  This will install into your cluster:
- A `strimzi` namespace, containing the Strimzi Operator, installed using the Strimzi helm chart.
- A `kafka` namespace, containing a Kafka cluster provisioned by Strimzi.
- A `postgres` namespace, containing a Postgres instance managed by the Bitnami Postgres helm chart.
- A `shipping` namespace, containing the application microservices, and secrets to provide access to the backing services. Each service is installed using its respective helm chart.

Prereqs:
- Ensure you have run the `./scripts/clone.sh` script.
- Helm is required. Helm v3 is recommended.

TODO: Update once scripts are in a tidier place

TODO: Remove hard-coded references to published images in scripts

1. Install the backing services: run `./install-infra.sh`
1. Install the application components: run `./install-app.sh`
1. Run the integration tests to verify your deployment: run `./run-integration-tests.sh`

The integration tests are run as a Kubernetes job inside the cluster.

#### Reinstalling / uninstalling

To reinstall the application, run `./uninstall-app.sh` and then `./install-app.sh`. This will also delete and recreate the Kafka topics for the application.

To uninstall everything, run the `./uninstall.sh` script. This will remove everything that was installed, including the four namespaces `shipping`, `postgres`, `kafka` and `strimzi`.

### Building this booklet locally

The content of this repository is written with markdown files, packaged with [MkDocs](https://www.mkdocs.org/) and can be built into a book-readable format by MkDocs build processes.

1. Install MkDocs locally following the [official documentation instructions](https://www.mkdocs.org/#installation).
1. Install Material plugin for mkdocs:  `pip install mkdocs-material` 
2. `git clone https://github.com/ibm-cloud-architecture/refarch-kc.git` _(or your forked repository if you plan to edit)_
3. `cd refarch-kc`
4. `mkdocs serve`
5. Go to `http://127.0.0.1:8000/` in your browser.

### Building this booklet locally but with docker

In some cases you might not want to alter your Python setup and rather go with a docker image instead. This requires docker is running locally on your computer though.

* docker pull squidfunk/mkdocs-material
* git clone https://github.com/ibm-cloud-architecture/refarch-eda.git (or your forked repository if you plan to edit)
* docker run --rm -it -p 8000:8000 -v ${PWD}:/docs squidfunk/mkdocs-material
* Go to http://127.0.0.1:8000/ in your browser.

### Pushing the book to GitHub Pages

1. Ensure that all your local changes to the `master` branch have been committed and pushed to the remote repository.
   1. `git push origin master`
2. Ensure that you have the latest commits to the `gh-pages` branch, so you can get others' updates.
	```bash
	git checkout gh-pages
	git pull origin gh-pages
	
	git checkout master
	```
3. Run `mkdocs gh-deploy` from the root refarch-kc directory.

--- 

## Contribute

As this implementation solution is part of the Event Driven architeture reference architecture, the [contribution policies](./CONTRIBUTING.md) apply the same way here.

**Contributors:**

* [Jerome Boyer](https://www.linkedin.com/in/jeromeboyer/)
* [Martin Siegenthaler](https://www.linkedin.com/in/martin-siegenthaler-7654184/)
* [David Engebretsen](https://www.linkedin.com/in/david-engebretsen/)
* [Francis Parr](https://www.linkedin.com/in/francis-parr-26041924)
* [Hemankita Perabathini](https://www.linkedin.com/in/hemankita-perabathini/)

Please [contact me](mailto:boyerje@us.ibm.com) for any questions.
