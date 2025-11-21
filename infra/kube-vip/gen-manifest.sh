#!/bin/sh

KVVERS='v1.0.2'
CONTAINERD_ADDRESS='/run/k3s/containerd/containerd.sock'
CONTAINERD_NAMESPACE='k8s.io'
TIMESTAMP=$(date +%s)

 alias kube_vip='sudo -E ctr run --rm --net-host ghcr.io/kube-vip/kube-vip:$KVVERS vip /kube-vip'

 kube_vip manifest daemonset --interface lo --address 10.16.23.200 \
 --controlplane --services --enableEndpointSlices --servicesElection --taint --inCluster \
 --bgp --localAS 65020 --bgpRouterID 10.16.22.182 --bgppeers 10.16.87.101:65020::false | tee ds-kubevip-$TIMESTAMP.yaml

