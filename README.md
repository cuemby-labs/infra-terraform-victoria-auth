# Awesome Walrus Template

Terraform module which deploys Victoria Metrics Auth any kubernetes cluster.

## Usage

```hcl
module "victoria_auth" {
  source = "./modules/victoria_auth"            # Path to the module

  namespace_name     = "victoria-system"        # The namespace where the Helm chart will be created
  release_name       = "victoria-metrics-auth"  # The name of the Helm release
  chart_version      = "0.8.0"                  # The version of the Helm chart
  ingress_enabled    = "true"                   # Enable Ingress
  domain_name        = "dev.domainname.com"     # Domain Name for the service
  issuer_name        = "origin-ca-issuer"       # Ingress Name
  issuer_kind        = "ClusterOriginIssuer"    # Ingress Kind
  ingress_class_name = "nginx"                  # Ingress Class Name

  resources = {
    limits = {
      cpu    = "200m"
      memory = "256Mi"
    }
    requests = {
      cpu    = "100m"
      memory = "128Mi"
    }
  }
}
```

## Examples

- ...
- ...

## Contributing

Please read our [contributing guide](./docs/CONTRIBUTING.md) if you're interested in contributing to Walrus template.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.23.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.23.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | >= 2.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.example](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [helm_release.example](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace_name"></a> [namespace_name](#input_namespace_name) | Namespace where the Helm Chart will be installed. | `string` | `"victoria-system"` | no |
| <a name="input_release_name"></a> [release_name](#input_release_name) | Name for the Helm release. | `string` | `"victoria-metrics-single"` | no |
| <a name="input_chart_version"></a> [chart_version](#input_chart_version) | Version for the Helm chart. | `string` | `"0.13.0"` | no |
| <a name="input_domain_name"></a> [domain_name](#input_domain_name) | Domain Name configuration. | `string` | `dev.domainname.com` | yes |
| <a name="input_ingress_enabled"></a> [ingress_enabled](#input_ingress_enabled) | Enable Ingress configuration. | `bool` | `true` | no |
| <a name="input_issuer_name"></a> [issuer_name](#input_issuer_name) | Ingress Issuer Name. | `string` | `origin-ca-issuer` | no |
| <a name="input_issuer_kind"></a> [issuer_kind](#input_issuer_kind) | Ingress Issuer Kind. | `string` | `ClusterOriginIssuer` | no |
| <a name="input_ingress_class_name"></a> [ingress_class_name](#input_ingress_class_name) | Ingress Class Name. | `string` | `nginx` | n
| <a name="input_resources"></a> [resources](#input_resources) | Resource limits and requests for helm Chart pods. | `map(map(string))` | `"See example"` | no |
| <a name="input_context"></a> [context](#input\_context) | Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.<br><br>Examples:<pre>context:<br>  project:<br>    name: string<br>    id: string<br>  environment:<br>    name: string<br>    id: string<br>  resource:<br>    name: string<br>    id: string</pre> | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_submodule"></a> [submodule](#output\_submodule) | The message from submodule. |
| <a name="output_walrus_environment_id"></a> [walrus\_environment\_id](#output\_walrus\_environment\_id) | The id of environment where deployed in Walrus. |
| <a name="output_walrus_environment_name"></a> [walrus\_environment\_name](#output\_walrus\_environment\_name) | The name of environment where deployed in Walrus. |
| <a name="output_walrus_project_id"></a> [walrus\_project\_id](#output\_walrus\_project\_id) | The id of project where deployed in Walrus. |
| <a name="output_walrus_project_name"></a> [walrus\_project\_name](#output\_walrus\_project\_name) | The name of project where deployed in Walrus. |
| <a name="output_walrus_resource_id"></a> [walrus\_resource\_id](#output\_walrus\_resource\_id) | The id of resource where deployed in Walrus. |
| <a name="output_walrus_resource_name"></a> [walrus\_resource\_name](#output\_walrus\_resource\_name) | The name of resource where deployed in Walrus. |
<!-- END_TF_DOCS -->

## License

Copyright (c) 2023 [Seal, Inc.](https://seal.io)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at [LICENSE](./LICENSE) file for details.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
