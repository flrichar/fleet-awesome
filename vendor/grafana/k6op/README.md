### Grafana K6 Operator

The k6-operator uses two CRDs, `TestRun` and  `PrivateLoadZones`, with the latter integrated with Grafana Cloud K6, this repo covers an example of the TestRun custom resource.

[Installation](https://grafana.com/docs/k6/latest/set-up/set-up-distributed-k6/install-k6-operator/)

```
helm install step

helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install k6-operator grafana/k6-operator
...

kubectl create configmap smoke-test --from-file=smoke.js  --dry-run=client -o yaml 
kubectl create configmap breakpoint --from-file=breakpoint.js --dry-run=client -o yaml

```

[TestRun CRD Information](https://grafana.com/docs/k6/latest/set-up/set-up-distributed-k6/usage/executing-k6-scripts-with-testrun-crd/#run-k6-scripts-with-testrun-crd)

The `TestRun` CRD is preferred over `PLZ` (PrivateLoadZones) which require the Grafana Cloud-based service. An important goal in the lab was to keep resrouces locally based as possible.

### Experimentation Guidelines

The `k6` binary can be used standalone, however I required an automated way to perform the load-tests from inside of a lab kubernetes cluster. Of all the [Load Test Types](https://grafana.com/docs/k6/latest/testing-guides/test-types/) the two I decided to use in the lab were the `Smoke` test representing the lower end baseline, and `Breakpoint`.

* Smoke test is run against a local lab service to represent the baseline of service operations.
* Breakpoint runs to accomodate about 20k virtual users (`vus`) in the lab, and should break at the 20k vus point.


#### History

The local lab has several local web services, wikis, tools, general information sites and other applications. There was an issue with the nginx-ingress [not respecting cpu cgroup v2 limits](https://github.com/kubernetes/ingress-nginx/issues/9665), so a major goal was to limit the ingress-controller pod resources via resource requests and limits as much as possible, to prevent cpu resource exhaustion on the nodes. 


The K6 Smoke Test is good baseline test to run while the Breakpoint is good to push the limits of what the ingress controller should handle.

---
