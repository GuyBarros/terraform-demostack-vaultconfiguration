resource "vault_jwt_auth_backend" "oidc" {
    description  = "Azure AD OIDC"
    path = "oidc"
    type = "oidc"
    oidc_discovery_url="https://login.microsoftonline.com/${var.tenant_id}/v2.0"
    oidc_client_id= var.client_id
    oidc_client_secret = var.client_secret
    default_role="oidcdemo"    
}

resource "vault_jwt_auth_backend_role" "oidcdemo" {
  backend         = vault_jwt_auth_backend.oidc.path
  role_name       = "oidcdemo"
  token_policies  = ["default", "superuser"]

 bound_audiences= [var.client_id]
  user_claim            = "sub"
  role_type             = "oidc"
  allowed_redirect_uris = ["http://${var.vault_addr}:8200/ui/vault/auth/oidc/oidc/callback","http://${var.vault_addr}:8250/oidc/callback"]
  claim_mappings = {"dysplayname"="dysplayname","surname"="surname","givenname"="givenname","preferred_username"="preferred_username","unique_name"="unique_name","email"="email","name"="name"} 
}

   
# az ad app update --id <client_id> --reply-urls "http://${var.vault_addr}:8200/ui/vault/auth/oidc/oidc/callback" "http://${var.vault_addr}:8250/oidc/callback "