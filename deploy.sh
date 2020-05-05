#!/usr/bin/env bash

if [[ $(kubectl get ns | grep -c logging) -eq 0 ]]; then
    kubectl create ns logging
fi

echo "Installing elasticsearch"
pushd $(dirname ${BASH_SOURCE[0]})/elastic/k8s/ > /dev/null
kubectl apply -f .
popd >/dev/null

echo "Installing kibana"
pushd $(dirname ${BASH_SOURCE[0]})/kibana/k8s/ > /dev/null
kubectl apply -f .
popd >/dev/null

echo "Installing filebeat"
pushd $(dirname ${BASH_SOURCE[0]})/filebeat/k8s/ > /dev/null
kustomize build . | kubectl apply -f -
popd >/dev/null
