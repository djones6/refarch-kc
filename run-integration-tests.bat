kubectl apply -f itg-tests\es-it\ReeferItgTests.yaml -n shipping
SET POD_NAME=
FOR /F "tokens=* USEBACKQ" %%F IN (`kubectl get pods -l job-name^=reefer-itgtests-job -n shipping -o jsonpath^="{.items[0].metadata.name}"`) DO (
        SET POD_NAME=%%F
    )
kubectl logs %POD_NAME% -n shipping -f
