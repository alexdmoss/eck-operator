#!/usr/bin/env bash

kubectl get secret mw-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo
