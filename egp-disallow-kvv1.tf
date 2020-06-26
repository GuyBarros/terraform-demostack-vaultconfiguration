resource "vault_egp_policy" "allow-all" {
  name = "allow-all"
  paths = ["*"]
  enforcement_level = "soft-mandatory"

  policy = <<EOT
main = rule {
  true
}
EOT
}
