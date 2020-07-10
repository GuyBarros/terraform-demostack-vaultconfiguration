data "http" "kvv1-policy" {
  url = "https://raw.githubusercontent.com/hashicorp/vault-guides/master/governance/sentinel/prevent-kv-v1-engines.sentinel"
}

resource "vault_egp_policy" "prevent-kvv1" {
  name = "prevent-kvv1"
  paths = ["*"]
  enforcement_level = "hard-mandatory"

  policy = file("./policies/sentinel/prevent-kv-v1-engines.sentinel")
 #policy = data.http.kvv1-policy.body
}


