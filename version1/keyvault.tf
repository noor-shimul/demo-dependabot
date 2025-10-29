resource "azurerm_key_vault" "workload" {
  name                        = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  enabled_for_deployment      = true
  enabled_for_disk_encryption = true
  enable_rbac_authorization   = true
  sku_name                    = "standard"
  provider                    = azurerm.spoke
  depends_on                  = [azurerm_resource_group.workload]
  lifecycle {
    ignore_changes = [tags]
  }
}

resource "azurerm_role_assignment" "workload" {
  scope                = azurerm_key_vault.workload.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azapi_resource.flex_function.identity[0].principal_id
  provider             = azurerm.spoke
  depends_on           = [azurerm_key_vault.workload, azapi_resource.flex_function]
}

resource "azurerm_role_assignment" "kv_read_to_sp" {
  scope                = azurerm_key_vault.workload.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = var.service_connection_id
  provider             = azurerm.spoke
  depends_on           = [azurerm_key_vault.workload]
}

data "azurerm_key_vault" "kv-smss-dogs-001" {
  name                = var.keyvault_dogs_name
  resource_group_name = var.keyvault_dogs_rg_name
  provider            = azurerm.spoke
}

data "azurerm_key_vault_secret" "vm-dogs-app01-password" {
  name         = "vm-dogs-app01-password"
  key_vault_id = data.azurerm_key_vault.kv-smss-dogs-001.id
  provider     = azurerm.spoke
}
data "azurerm_key_vault_secret" "vm-dogs-sql01-password" {
  name         = "vm-dogs-sql01-password"
  key_vault_id = data.azurerm_key_vault.kv-smss-dogs-001.id
  provider     = azurerm.spoke
}
data "azurerm_key_vault_secret" "vm-dogs-sql01-sql-connectivity-password" {
  name         = "vm-dogs-sql01-sql-connectivity-password"
  key_vault_id = data.azurerm_key_vault.kv-smss-dogs-001.id
  provider     = azurerm.spoke
}
resource "azurerm_key_vault_secret" "vm-monitoring-app-password001" {
  depends_on   = [azurerm_role_assignment.kv_read_to_sp]
  name         = data.azurerm_key_vault_secret.vm-dogs-app01-password.name
  value        = data.azurerm_key_vault_secret.vm-dogs-app01-password.value
  key_vault_id = azurerm_key_vault.workload.id
  provider     = azurerm.spoke
}
resource "azurerm_key_vault_secret" "vm-dogs-sql01-password" {
  depends_on   = [azurerm_role_assignment.kv_read_to_sp]
  name         = data.azurerm_key_vault_secret.vm-dogs-sql01-password.name
  value        = data.azurerm_key_vault_secret.vm-dogs-sql01-password.value
  key_vault_id = azurerm_key_vault.workload.id
  provider     = azurerm.spoke
}
resource "azurerm_key_vault_secret" "vm-dogs-sql01-sql-connectivity-password" {
  depends_on   = [azurerm_role_assignment.kv_read_to_sp]
  name         = data.azurerm_key_vault_secret.vm-dogs-sql01-sql-connectivity-password.name
  value        = data.azurerm_key_vault_secret.vm-dogs-sql01-sql-connectivity-password.value
  key_vault_id = azurerm_key_vault.workload.id
  provider     = azurerm.spoke
}

resource "azurerm_key_vault_secret" "sql_secrets" {
  for_each = var.dog_app_secrets

  name         = each.key
  value        = each.value
  key_vault_id = azurerm_key_vault.workload.id
  provider     = azurerm.spoke
}
