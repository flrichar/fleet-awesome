## Fleet Awesome

A curated list of minimal reproducible examples, usable via SUSE Rancher Fleet. All assets are quick and minimal, focusing on a local lab environment. Customization with flexible config through secrets or downstream cluster `ConfigMap` objects. By default the options for the Bundles, _or snippets, recipes,_ are opnionated towards operational efficiency, proof-of-concepts or pilot experiments.
Unlike other "awesome-something" lists, the role of Fleet is as a facilitator for gitops operations with the repository using fleet-focused conventions and formatting.


## QuickStart

#### Git ####
 * Fork the repository
 * Add a git remote with a unique name for your new fork
 * (Optional) Create a branch for your changes and testing
 * (Optional) Create Pull Requests (PRs) in GitHub for submitting your branch changes

#### Fleet ####
 * If you have Rancher installed, you already have a Fleet Controller on the Local Cluster
   * The UI option for Continuous Delivery is Fleet's _"SailBoat"_ icon
   * connections established to Downstream Clusters with their Fleet-Agent
 * For each project, create one or more `GitRepo` resources, see `GenericExample-ClusterGroup.yaml` and `GenericExample-GitRepo.yaml` in the main repo root folder
   * more examples under `/misc/location/parslab/sublevel/fleet-controller`
 * Each GitRepo can have one or more paths to where the recipes live under your new forked repo
 * Assign `Clusters` (`clusters.fleet.cattle.io`) to `ClusterGroups` with labels
   * Fleet pulls the repo data with a `GitJob`, then creates `Bundles` from `fleet.yaml` files for HelmCharts & Kustomizations
 * Final result is a `BundleDeployment` sent and deployed by the fleet-agent in the Downstream cluster for the target defined in the `ClusterGroup`
   * Here _Target_ is a reference to a downstream Cluster and/or Namespaces on that cluster, depending on wether `Bundles` need to deploy namespaced or cluster-wide resources

_CRD Flow_

Each snippet or recipe relies on Fleet CRDs to generate and deilver a `Bundle` to the target `Clusters`. 
 * See the Fleet CRD workflow outlined in the diagram below.

![Fleet CRD Flow](crdflow-faw.png "Fleet CRD Flow")

See the Fleet docs about [bundle lifecycle stages](https://fleet.rancher.io/ref-bundle-stages) for more information.
  
## Category Structure

 * _LLMAI_ - Tooling to assist with AI & LLM related workloads and experiments in your lab cluster environment.
 * _Infra_ - infrastructure-related assets, including CNI configurations, K8s distributions, dual-stack, and ingresses.
 * _Misc_ - any example or asset that does not fit into other categories, or upstream open source projects that might be covered in AppCo.
 * _Security_ - security-focused and other related topics, secrets, service mesh, mtls.
 * _Storage_ - CSI-related assets, homelab-focused storage options like minio and NFS.
 * _Vendor_ - any vendor-specific assets which may or may not be open source, or have a vendor-component in the asset, manifests, or charts.  The primary example is Application Collection.

### Features
 
 * Avoid longer names for labels and charts with a 63 character limit. Achieved through `helm.releaseName` option.
 * Avoid clobbering existing resources, through use of `helm.takeOwnership: false` option, for example when a Bundle is deployed into a pre-existing Namespace.
 * Use of Kustomization configuration options for safer deployment and targeting.
 * Day Two operations respecting existing Namespaces, Secrets and ConfigMap resources for targeted ClusterGroups.

_Next Steps_

* Future bundle topics like Elemental, GatewayAPI, ClusterAPI
* wrap-up and enduser testing, teammate feedback for QA
* QA, unit tests for charts and bundle templates

