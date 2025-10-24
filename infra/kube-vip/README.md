### Kube-VIP 

The assets include the necessary cloud-controller, the required rbac, and the global-cidr configmap for the cloud-controller configuration. See the [upstream docs](https://kube-vip.io/docs/) for more information.

The Daemonset manifest includes options flags set for controlplane, services, endpointslices, serviceselection, taint, incluster, and various BGP settings.  See `gen-manifest.sh` file for more info.  BGP settings can be customized either via the script (localAS, RouterID, bgppeers) or with kustomization patches.

The upstream developers also have a [manifest-gen site](https://thebsdbox.co.uk/kube-vip/) to expierment with, changing the manifest to a deployment or to support L2/ARP mode versuse L3/BGP mode.

_TODO_
- [X] include kustomizations for ds, rbac, cloud-controller
- [ ] patches for cidr configmap, daemonset address, ASN, RouterID, & Peers 

---
