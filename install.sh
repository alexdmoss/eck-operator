#!/usr/bin/env bash

echo
echo "NB: This cannot be run in CI due to high privileges needed"
echo

echo "-> Creating cluster-admin role binding"
kubectl create clusterrolebinding eck-cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config list account --format "value(core.account)")

echo; echo "-> Installing operator"
kubectl apply -f operator/all-in-one-1.1.yaml

echo; echo "-> Bootstrapping filebeat RBAC permissions"
kubectl apply -f filebeat/bootstrap/*.yaml
