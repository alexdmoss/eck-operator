#!/usr/bin/env bash

kubectl create clusterrolebinding eck-cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config list account --format "value(core.account)")

kubectl apply -f operator/all-in-one-0.9.yaml

