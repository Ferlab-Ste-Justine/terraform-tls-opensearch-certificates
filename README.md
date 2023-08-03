# About

Taking corresponding private keys as arguments, this terraform module will generate the following certificates for an openseach cluster:
  - CA certicate
  - Servers certificate
  - Admin user client certificate

The certificates will be generated in a format expected by our opensearch terraform modules.

# Input Variables

- **organization**: Organization subject field of all certificates. It should match the **opensearch.auth_dn_fields.organization** parameter you are passing to your opensearch nodes.
- **ca_certificate_lifespan**: Lifespan of your CA certificate in hours. Defaults to 100 years.
- **ca_certificate_early_renewal_window**: Renew window before your CA certificate expires in hours where terraform will start trying to reprovision the CA certificate. Defaults to 1 year.
- **ca_key**: Private key that should be used to generate the CA certficiate.
- **ca_common_name**: CN subject field for the CA certificate. Defaults to **opensearch-ca**.
- **node_common_name**: CN subject field for the server certificate. It should match the **opensearch.auth_dn_fields.node_common_name** parameter you are passing to your opensearch nodes.
- **server_certificate_lifespan**: Lifespan of your server certificate in hours. Defaults to 100 years.
- **server_certificate_early_renewal_window**: Renew window before your server certificate expires in hours where terraform will start trying to reprovision the CA certificate. Defaults to 1 year.
- **server_key**: Private key that should be used to generate the server certficiate.
- **admin_common_name**: CN subject field for the admin client certificate. It should match the **opensearch.auth_dn_fields.admin_common_name** parameter you are passing to your opensearch nodes.
- **admin_certificate_lifespan**: Lifespan of your admin certificate in hours. Defaults to 100 years.
- **admin_certificate_early_renewal_window**: Renew window before your admin certificate expires in hours where terraform will start trying to reprovision the CA certificate. Defaults to 1 year.
- **admin_key**: Private key that should be used to generate the admin certficiate.
- **cluster_domains**: Domains to put in SAN of the server certificate. All domain names you expect any of the opensearch servers to be represented with should be in that list. Additionally, **localhost** will be added by the module.
- **cluster_ips**: Ips to put in the SAN of the server certificate. All server ips if your opensearch nodes should be in that list. Additionally, **127.0.0.1** will be added by the module.

# Output Variables

- **ca_certificate**: The ca certificate as a string in pem format
- **server_certificate**: The server certificate to pass to all opensearch nodes as a string in pem format
- **admin_certificate**: The admin client certificate as a string in pem format