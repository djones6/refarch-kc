:: Deploy integration tests job
sed -e's#value: "IBMCLOUD#value: "LOCAL#' -e's#value: "itg-#value: "#' itg-tests/es-it/ReeferItgTests.yaml > itg-tests/es-it/ReeferItgTests.yaml.local
kubectl apply -f itg-tests/es-it/ReeferItgTests.yaml.local -n shipping

:: Wait for job pod to be ready (ie. job has started running)
:: This will take seconds, unless the image needs pulling from a remote registry.
kubectl wait --for=condition=ready pod -l job-name=reefer-itgtests-job -n shipping --timeout 180s

:: Follow the job log
kubectl logs job/reefer-itgtests-job -n shipping -f
