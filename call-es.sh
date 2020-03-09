#!/usr/bin/env bash
PASSWORD=$(kubectl get secret mw-es-elastic-user -n=logging -o=jsonpath='{.data.elastic}' | base64 --decode)

kubectl port-forward -n=logging service/mw-es-http 9200 &

sleep 1

curl -u "elastic:$PASSWORD" -k "https://localhost:9200"

kill $(ps -ef | grep port-forward | grep -v grep | awk '{print $2}')
