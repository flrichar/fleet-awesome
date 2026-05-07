## agent-sandbox

The **agent-sandbox** is a dedicated environment designed to test and refine **autonomous logic** and AI-driven workflows within your cluster. It provides the necessary manifests to spin up *isolated workloads*, making it ideal for rapid prototyping on both local and small-scale cloud clusters. The goal is to create a **safe playground** where developers and support teams can experiment with model interactions without impacting broader infrastructure stability. By leveraging lightweight deployment patterns, this sandbox ensures that AI utilities remain **modular and portable** across various development stages. These resources are built to align with standard **GitOps practices**, facilitating a smooth transition from experimental code to managed manifests. Use this directory to explore the practical integration of ***intelligent tooling*** into your existing Kubernetes environment.

This directory holds the primary `agent-sandbox` operator that uses the `Sandbox` CRD. At this time it only installs the core components but not the extensions for getting started.  The sandbox files included in the path are examples of different isolated singleton workloads to experiment with.

For more information, see the [Agent Sandbox SIG Documentation](https://agent-sandbox.sigs.k8s.io/docs/). 

### Requirements

Additional `RuntimeClass` resources are necessary for secure isolation.

* `kata-deploy` for vm-level kata-containers
* `gvisor` for kernel-level isolation

---
