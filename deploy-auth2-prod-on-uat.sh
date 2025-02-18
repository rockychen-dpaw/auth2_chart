#!/bin/bash
isprod=$(kubectl config get-contexts | grep  -E "\*\s+az-aks-oim03" | wc -l)
if [[ ${isprod} -eq 1 ]]; then
    echo "Kubectl is connected to az-aks-oim03, begin to deploy redis in prod env"
else
    echo "Kubectl is not connected to az-aks-oim03, can't deploy redis in prod env"
    exit 1
fi

./deploy.sh  upgrade --values values-prod-on-uat.yaml -n sso auth2-04 ./
