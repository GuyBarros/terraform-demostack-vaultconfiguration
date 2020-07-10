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
