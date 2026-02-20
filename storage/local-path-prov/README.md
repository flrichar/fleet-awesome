### Local Path Provisioner

Currently for testing kustomize manifests. Working... Clusters are targeted via GitRepo, clusterGroupSelector in the ClusterGroup labels that match the application, move Clusters into and out of ClusterGroups, add/remove labels to enable different apps in each ClusterGroup.

Note, errors around permission denied and selinux, change the selinux context to whatever is appropriate for your specific system profile.

```
chcon system_u:object_r:container_file_t:s0 /opt/local-path-provisioner

# or whatever is proper for your specific environment
```

...
