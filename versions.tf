terraform {
  required_providers {
    cloudinit = {
      source  = "hashicorp/tls"
      version = ">= 4.0.0, < 5.0.0"
    }
  }
  required_version = ">= 1.0.0"
}