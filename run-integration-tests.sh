#!/bin/sh

# Deploy integration tests job
kubectl apply -f itg-tests/es-it/ReeferItgTests.yaml -n shipping

# Wait for job pod to be ready (ie. job has started running)
kubectl wait --for=condition=ready pod -l job-name=reefer-itgtests-job -n shipping

# Follow the job log
kubectl logs job/reefer-itgtests-job -n shipping -f
