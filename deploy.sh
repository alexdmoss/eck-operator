#!/usr/bin/env bash

if [[ $(kubectl get ns | grep -c logging) -eq 0 ]]; then
    kubectl create ns logging
fi

echo "Installing elasticsearch"
kubectl apply -f ./elastic/k8s/

echo "Installing kibana"
kubectl apply -f ./elastic/k8s/

echo "Installing filebeat"
kubectl apply -f ./filebeat/k8s/