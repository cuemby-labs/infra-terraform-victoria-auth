#
# Victoria Metrics Variables
#

variable "helm_release_name" {
  description = "The name of the Helm release."
  type        = string
  default     = "victoria-metrics-auth"
}

variable "namespace_name" {
  description = "The namespace where the Helm release will be installed."
  type        = string
  default     = "victoria-system"
}

variable "helm_chart_version" {
  description = "The version of the victoria-metrics-auth Helm chart."
  type        = string
  default     = "0.8.0"
}

variable "resources" {
  description = "Resource limits and requests for the Helm release."
  type        = map(map(string))

  default = {
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

#
# Victoria Auth Ingress
#

variable "ingress_enabled" {
  type        = bool
  description = "Victoria Auth Ingress Enabled"
  default     = "true"
}
variable "domain_name" {
  type        = string
  description = "Domain name for Victoria Auth, e.g. 'dev.domainname.com'"
  default     = "dev.domainname.com"
}

variable "issuer_name" {
  type        = string
  description = "Origin issuer name"
  default     = "origin-ca-issuer"
}

variable "issuer_kind" {
  type        = string
  description = "Origin issuer kind"
  default     = "ClusterOriginIssuer"
}

variable "ingress_class_name" {
  type        = string
  description = "Ingress Class Name"
  default     = "nginx"
}


#
# Contextual Fields
#

variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}