
### Bitwarden Secrets Manager Kubernetes Operator

The sm-operator uses a controller to synchronize Bitwarden secrets into Kubernetes secrets. The operator registers the Custom Resource Definition: BitwardenSecret into the Kubernetes cluster. The cluster will listen for the newly registered BitwardenSecret, and synchronize on a configurable interval.

  * Documentation: https://bitwarden.com/help/secrets-manager-kubernetes-operator/
  * `external-secrets` operator also as a client, requires cert-manager for bitwarden-sdk-server certs
  * `values00.yaml` in the current dir are directly from the documentation example
  * Note: the `BitwardenSecret` CRD syncs ALL of the secrets owned/readable by a particular machine account, see [this github issue](https://github.com/bitwarden/sm-kubernetes/issues/60) ... for free tier (lab), may want to restrict machine account to 1-3 secrets

_UPDATES_
* Version 2.0.0 

---
