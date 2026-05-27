### Longhorn Storage

Longhorn is a lightweight, reliable and easy-to-use distributed block storage system for Kubernetes.
Longhorn is free, open source software. Originally developed by Rancher Labs, it is now being developed as a incubating project of the Cloud Native Computing Foundation.

This Fleet bundle installs the Helm chart with safe values to ignore changes in modified CRDs to prevent the Bundle from showing as `Modified`.

See the docs for [installing via Fleet](https://longhorn.io/docs/1.11.2/deploy/install/install-with-fleet/), included is a sample GitRepo from the documentation, with `keepResources: true` enabled for safety.

