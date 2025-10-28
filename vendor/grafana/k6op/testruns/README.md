### TestRun CRDs for K6-Operator

Makes use of `dependsOn` to ensure the fleet bundle for the K6 Operator is installed first. [Troubleshooting Docs](https://grafana.com/docs/k6/latest/set-up/set-up-distributed-k6/usage/common-options/) for deploying various tests, first two examples are `SmokeTest` and `BreakPoint`.

The bundle creates simple TestRun CRDs for both `SmokeTest` and `Breakpoint` targeting example local-lab web app endpoints.

---
