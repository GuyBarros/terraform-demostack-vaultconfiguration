resource "vault_policy" "nomad-server" {
  name = "nomad-server"

  policy = file("./policies/acl/nomad-server.hcl")

}

resource "vault_policy" "test" {
  name = "test"

  policy = file("./policies/acl/test.hcl")

}

resource "vault_policy" "superuser" {
  name = "superuser"

  policy = file("./policies/acl/superuser.hcl")

}

resource "vault_token_auth_backend_role" "nomad-cluster" {
  role_name           = "nomad-cluster"
  disallowed_policies = ["nomad-server"]
  orphan              = false
  token_period              = "259200"
  renewable           = true
  token_explicit_max_ttl    = "0"
}


#   echo "--> Creating Nomad token role"
#   vault write auth/token/roles/nomad-cluster \
#     name=nomad-cluster \
#     period=259200 \
#     renewable=true \
#     orphan=false \
#     disallowed_policies=nomad-server \
#     explicit_max_ttl=0

