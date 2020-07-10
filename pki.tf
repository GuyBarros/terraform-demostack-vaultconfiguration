resource "vault_pki_secret_backend" "pki" {
  path = var.pki_mount_path
  default_lease_ttl_seconds = 3600
  max_lease_ttl_seconds = 86400
}


resource "vault_pki_secret_backend_root_cert" "pki" {
  depends_on = [ vault_pki_secret_backend.pki ]

  backend = vault_pki_secret_backend.pki.path

  type = "internal"
  common_name = "*.service.consul"
  ttl = "315360000"
  format = "pem"
  private_key_format = "der"
  key_type = "rsa"
  key_bits = 4096
  exclude_cn_from_sans = true
  ou = "Solution Egineering"
  organization = "Hashicorp"
}

resource "vault_pki_secret_backend_role" "consul-service" {
  backend = vault_pki_secret_backend.pki.path
  name    = "consul-service"
  allow_localhost = true
  allow_any_name = true
  allow_ip_sans = true
  ou = ["Solution Egineering"]
  organization = ["Hashicorp"]
}