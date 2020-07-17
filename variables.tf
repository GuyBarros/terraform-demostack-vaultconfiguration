
#KV
variable "kv_path" {
  description = "key value secret engine mount point"
  default = "kv"
}


variable "secret_path" {
  description = "Secret path"
  default = "kv/demo"
}

variable "secret_data" {
  description = "Secret content"
  default = "{\"login\": \"anonymous\", \"password\": \"guest\", \"ttl\": \"20s\"}"
}



#PKI
variable "pki_mount_path" {
  description = "key value secret engine mount point"
  default = "pki"
}


#Azure OIDC Auth

variable "vault_addr" {
  description = "your address"
  default = "localhost"
}


variable "subscription_id" {
  description = "your subscription ID for Vault KMS Auto Unseal"
}

variable "tenant_id" {
  description = "your tenant ID for Vault KMS Auto Unseal"
}

variable "client_id" {
  description = "your client ID for Vault KMS Auto Unseal"
}

variable "client_secret" {
  description = "your client ID for Vault KMS Auto Unseal"
}