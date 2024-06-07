resource "azurerm_key_vault" "example" {
  name                        = "examplekv"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  soft_delete_retention_days  = 7
  purge_protection_enabled    = true
}

resource "azurerm_key_vault_secret" "example" {
  name         = "example-secret"
  value        = "example-value"
  key_vault_id = azurerm_key_vault.example.id
}

