resource "tls_self_signed_cert" "ca" {
  private_key_pem = var.ca_key

  subject {
    common_name  = var.ca_common_name
    organization = var.organization
  }

  validity_period_hours = var.ca_certificate_lifespan
  early_renewal_hours = var.ca_certificate_early_renewal_window

  allowed_uses = [
    "digital_signature",
    "key_encipherment",
    "cert_signing",
  ]

  is_ca_certificate = true
}

resource "tls_cert_request" "server" {
  private_key_pem = var.server_key

  subject {
    common_name  = var.node_common_name
    organization = var.organization
  }

  dns_names = toset(concat(
    var.cluster_domains,
    ["localhost"]
  ))

  ip_addresses = toset(concat(
    var.cluster_ips,
    ["127.0.0.1"]
  ))
}

resource "tls_locally_signed_cert" "server" {
  cert_request_pem   = tls_cert_request.server.cert_request_pem
  ca_private_key_pem = var.ca_key
  ca_cert_pem        = tls_self_signed_cert.ca.cert_pem

  validity_period_hours = var.server_certificate_lifespan
  early_renewal_hours = var.server_certificate_early_renewal_window

  allowed_uses = [
    "server_auth",
    "client_auth"
  ]

  is_ca_certificate = false
}

resource "tls_cert_request" "admin" {
  private_key_pem = var.admin_key

  subject {
    common_name  = var.admin_common_name
    organization = var.organization
  }
}

resource "tls_locally_signed_cert" "admin" {
  cert_request_pem   = tls_cert_request.admin.cert_request_pem
  ca_private_key_pem = var.ca_key
  ca_cert_pem        = tls_self_signed_cert.ca.cert_pem

  validity_period_hours = var.admin_certificate_lifespan
  early_renewal_hours = var.admin_certificate_early_renewal_window

  allowed_uses = [
    "client_auth",
  ]

  is_ca_certificate = false
}