### Mini Istio Profile With GatewayAPI

This bundle installs the latest upstream Istio chart with only the `minimal` profile, meaning the control-plane `istiod` component only. Also, it enables `Gateway API` support and the latest standard Gateway API CRDs. This can be useful for when one wants to add simple Gateway API support to a cluster without a lot of extra subcharts.

See the [upstream Istio project documentation](https://istio.io/latest/docs/tasks/traffic-management/ingress/gateway-api/#setup) for more information.


