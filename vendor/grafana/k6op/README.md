### Grafana K6 Operator

The k6-operator uses two CRDs, `TestRun` and  `PrivateLoadZones`, with the latter integrated with Grafana Cloud K6, this repo covers an example of the TestRun custom resource.


#### Quick Start

[Installation](https://grafana.com/docs/k6/latest/set-up/set-up-distributed-k6/install-k6-operator/)

```
## helm install commands

helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install k6-operator grafana/k6-operator
...

kubectl create configmap smoke-test --from-file=smoke.js  --dry-run=client -o yaml 
kubectl create configmap breakpoint --from-file=breakpoint.js --dry-run=client -o yaml

```

[TestRun CRD Information](https://grafana.com/docs/k6/latest/set-up/set-up-distributed-k6/usage/executing-k6-scripts-with-testrun-crd/#run-k6-scripts-with-testrun-crd)

The `TestRun` CRD is preferred over `PLZ` (PrivateLoadZones) which require the Grafana Cloud-based service. An important goal in the lab was to keep resrouces locally based as possible.


### Experimentation & Evaluation Guidelines

The `k6` binary can be used standalone, however I required an automated way to perform the load-tests from inside of a lab kubernetes cluster. Of all the [Load Test Types](https://grafana.com/docs/k6/latest/testing-guides/test-types/) the two I decided to use in the lab were the `Smoke` test representing the lower end baseline, and `Breakpoint`.

* Smoke test is run against a local lab service to represent the baseline of service operations.
* Breakpoint runs to accomodate about 20k virtual users (`vus`) in the lab, and should break at the 20k vus point.


#### History & Demo Explanation

The local lab has several local web services, wikis, tools, general information sites and other applications. There was an issue with the nginx-ingress [not respecting cpu cgroup v2 limits](https://github.com/kubernetes/ingress-nginx/issues/9665), so a major goal was to limit the ingress-controller pod resources via resource requests and limits as much as possible, to prevent cpu resource exhaustion on the nodes. 


The K6 Smoke Test is good baseline test to run while the Breakpoint is good to push the limits of what the ingress controller should handle.

Keeping in mind this current evaluation experiment is for RKE2 and ingress-nginx controller _only_.  Other alternatives like traefik or gateway-api or other ingress controllers do not apply.

To limit ingress-nginx controller, a sample `HelmChartConfig` was created using the conventional naming `rke2-ingress-nginx` with the content setting `.controller.resources.limits` in the helm values to a preset lower value. The value can be modified later for any arbitrary value of `vus`, for example 20,000. When the requests are left empty in the HelmChartConfig, the defaults are used for the chart, in this case 90m for CPU and 100Mi for Memory.


```
---
apiVersion: helm.cattle.io/v1
kind: HelmChartConfig
metadata:
  name: rke2-ingress-nginx
  namespace: kube-system
spec:
  valuesContent: |-
    controller:
      resources:
        limits:
          cpu: 300m
          memory: 100Mi
      config:
        use-forwarded-headers: "true"
        keep-alive-requests: "2000"
        upstream-keepalive-requests: "1000"
        max-worker-connections: "1000"

```

A completed test will demonstrate how many VUs the ingress-controller can adequately handle at the current resource level set in the HelmChartConfig. When the test reaches the BreakPoint, it will either drop connections from cpu exhaustion or trigger an out-of-memory (OOM) error for memory exhaustion. This pattern is much like a circuit breaker.

The behavior of the breakpoint test, wether memory or cpu exhausts first depend on many factors, including how the application operates and its structure.


#### Goals, Evaluations to Consider

* How many users can the local lab support?
* What values for the ingress-controller limits make sense?
* Does the Application require more resources? Is it light or heavy?
* Does it make sense to circuit-break if the ingress-controller receives too many requests?

---
