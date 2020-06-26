resource "vault_github_auth_backend" "hashicorp" {
  organization = "hashicorp"
}

resource "vault_github_team" "team-se" {
  backend  = vault_github_auth_backend.hashicorp.id
  team     = "terraform-developers"
  policies = ["default", "superuser"]
}
