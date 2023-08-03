variable "organization" {
  description = "Expected organization for all certificates"
  type = string
}

variable "ca_certificate_lifespan" {
  description = "Lifespan of the ca certificate in hours"
  type = number
  default = 100 * 365 * 24
}

variable "ca_certificate_early_renewal_window" {
  description = "Window of time before the ca certificate expiry when terrafor should try to renew in hours"
  type = number
  default = 365 * 24
}

variable "ca_key" {
  description = "Private ca key"
  type = string
}

variable "ca_common_name" {
  description = "Common name for ca certificate"
  type = string
  default = "opensearch-ca"
}

variable "server_certificate_lifespan" {
  description = "Lifespan of the server certificate in hours"
  type = number
  default = 100 * 365 * 24
}

variable "server_certificate_early_renewal_window" {
  description = "Window of time before the server certificate expiry when terrafor should try to renew in hours"
  type = number
  default = 365 * 24
}

variable "server_key" {
  description = "Private ca key"
  type = string
}

variable "node_common_name" {
  description = "Expected common name for server certificate"
  type = string
}

variable "admin_certificate_lifespan" {
  description = "Lifespan of the admin certificate in hours"
  type = number
  default = 100 * 365 * 24
}

variable "admin_certificate_early_renewal_window" {
  description = "Window of time before the admin certificate expiry when terrafor should try to renew in hours"
  type = number
  default = 365 * 24
}

variable "admin_key" {
  description = "Private ca key"
  type = string
}

variable "admin_common_name" {
  description = "Expected common name for admin certificate"
  type = string
  default = "admin"
}

variable "cluster_domains" {
  description = "List of domains pointing to nodes in the cluster"
  type = list(string)
  default = []
}

variable "cluster_ips" {
  description = "List of ips pointing to nodes in the cluster"
  type = list(string)
}