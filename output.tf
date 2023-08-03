output "ca_certificate" {
  value = tls_self_signed_cert.ca.cert_pem
}

output "server_certificate" {
  value = tls_locally_signed_cert.server.cert_pem
}

output "admin_certificate" {
  value = tls_locally_signed_cert.admin.cert_pem
}