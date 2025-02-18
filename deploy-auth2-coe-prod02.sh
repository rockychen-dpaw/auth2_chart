#!/bin/bash
isprod=$(kubectl config get-contexts | grep  -E "\*\s+aks-coe-prod-02" | wc -l)
if [[ ${isprod} -eq 1 ]]; then
    echo "Kubectl is connected to aks-coe-prod-02, begin to deploy auth2 in prod env"
else
    echo "Kubectl is not connected to aks-coe-prod-02, can't deploy auth2 in prod env"
    exit 1
fi

./deploy.sh  upgrade --values values-coe-prod02.yaml -n sso auth2-05 ./

