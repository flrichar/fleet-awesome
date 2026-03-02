### Minio Single Pod NFS PoC

 This is a small, single-pod deployment of Minio, with an NFS backend as a proof-of-concept. The NFS mount is very simple, not a full-fledged CSI plugin, making this ideal for introducing an S3 compatible storage option to existing NFS backends. Volume is RWO so there is no redudancy, recommended for lab-use only. 

Although Minio was deprecated via license change in late 2025, there are projects to [resurrect the open source version](https://blog.vonng.com/en/db/minio-resurrect/). The `pigsty` project is a drop-in replacement for the image, replacing the `minio/mnio` image with the name `pgsty/minio`. This allows for the return of the console ui and patched CVE concerns in recent versions.

Gateway API resources have also recently been added.

---
