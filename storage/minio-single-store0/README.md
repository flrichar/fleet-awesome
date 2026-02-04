### Minio Single Pod NFS PoC

 This is a small, single-pod deployment of Minio, with an NFS backend as a proof-of-concept. The NFS mount is very simple, not a full-fledged CSI plugin, making this ideal for introducing an S3 compatible storage option to existing NFS backends. Volume is RWO so there is no redudancy, recommended for lab-use only. 


Other Notes:

 * Move the Issuer for cert-manager to ingress annotation?
 * See here: https://cert-manager.io/docs/tutorials/acme/nginx-ingress/#step-7---deploy-a-tls-ingress-resource
 * This can be the cfssl Issuer for internal CA / MultiRootCA
 * Zerk422 has ClusterIssuer.cfssl-issuer.wikimedia.org, different than cert-manager's ClusterIssuer/Issuer ...
 * Added optional `Gateway API` resources, Gateway & HTTPRoute

_TODO_
- [ ] test for portability
- [ ] uses CFSSL Issuer, introduce LE Issuer for nginx ingress controller
- [ ] modify Deployment `.spec.template.spec.containers.image` as a variable to control minio version, latest/pinned

...
