#!/usr/bin/env bash

if [[ $(kubectl get ns | grep -c logging) -eq 0 ]]; then
    kubectl create ns logging
fi

kubectl apply -f ./k8s/