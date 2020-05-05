# eck-operator

Thought I'd try out the new Elastic Cloud Operator for Kubernetes.

## Steps

1. Downloaded the all-in-one yaml can be downloaded from: https://download.elastic.co/downloads/eck/0.9.0/all-in-one.yaml
2. Updated the namespace to elastic-search, as I couldn't delete elastic-system from the last attempt!
3. Monitor the installation with `kubectl logs -f sts/elastic-operator`
4. Grabbed the quickstart example from https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-quickstart.html to define an `elasticsearch` option - saved in `./k8s/elastic-search.yaml`. Only change initially was to set the namespace.
5. Repeated above for Kibana
6. Adapt the quickstarts to fit on my small nodes pools (see `./k8s/`)

## Deleting

```sh
kubectl delete elastic --all --all-namespaces
kubectl delete -f operators/*.yaml
kubectl delete validatingwebhookconfigurations validating-webhook-configuration
```

## To Do

- [ ] Backup/restore
- [ ] Ingress / certs issue
- [ ] Clean up irrelevant fields
- [ ] Failed indexing in filebeat logs still there?
- [ ] Restore beats exporter
- [ ] Elastic --> Prometheus
- [ ] Elastic as a Grafana datasource?
