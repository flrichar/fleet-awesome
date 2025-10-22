**K6 Operator Overview**

1: Introduction
========================

* The k6 Operator is a Kubernetes operator that provides a convenient way to deploy, manage, and scale k6 tests.
* It supports multiple deployment methods, including bundle, Helm, and custom Makefile installation.

2: CRDs
------------

* The k6 Operator includes two custom resources (CRDs): `TestRun` and `PrivateLoadZone`.
* These CRDs are used to define and manage k6 tests in Kubernetes.
* The `TestRun` CRD is the most commonly used resource, as it represents a single k6 test execution.

3: Installing the Operator
--------------------------------

* There are three deployment methods available:
	1. Bundle installation using `kubectl apply`
	2. Helm installation using `helm install`
	3. Custom Makefile installation using `make deploy`

4: Watching Namespaces
-----------------------------

* By default, the k6 Operator watches all namespaces.
* You can configure the operator to watch specific namespaces by setting environment variables on the controller's deployment.

5: TestRun CRD Highlights
---------------------------

* **TestRun**: Represents a single k6 test execution.
* Can be used with multiple test scripts and parameters.
* Supports caching and retry mechanisms for improved reliability.
* Provides insights into test performance and metrics.

6: Best Practices
---------------------

* Use the `TestRun` CRD to manage individual test executions.
* Leverage the operator's built-in caching mechanism to reduce test execution time.
* Monitor test performance using the provided metrics.

7: Conclusion
==================

* The k6 Operator provides a flexible and scalable way to deploy and manage k6 tests in Kubernetes.
* By leveraging the `TestRun` CRD, you can streamline your testing workflows and gain insights into test performance.

---
