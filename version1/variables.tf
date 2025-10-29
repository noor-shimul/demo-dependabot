variable "address_prefixes" {
  type        = list(string)
  description = "The address prefixes to use for the subnet. Currently (@azurerm v3.105.0) only a single address prefix can be set as the Multiple Subnet Address Prefixes Feature is not yet in public preview or general availability."
}
variable "data_collection_rule_monitor_name" {
  type        = string
  description = "The name of the Data Collection Rule."
}
variable "azurerm_log_analytics_workspace_table" {
  type        = string
  description = "The name of the log analytics workspace table."
}
variable "data_collection_endpoint" {
  type        = string
  description = "The name of the monitor_data_collection_endpoint"
}


# variable "data_collection_rule_monitor_resource_group" {
#   type        = string
#   description = "The name of the Resource Group for the Data Collection Rule."
# }

variable "keyvault_name" {
  type        = string
  description = "The name of the Key Vault."
}

variable "keyvault_role_assignments" {
  description = "Assign azure RBAC Roles to the sp."
  type = list(object({
    id           = string
    principal_id = string
    role_name    = string
  }))

  default = []
}

# Variable for dogs app Key Vault Name
variable "keyvault_dogs_name" {
  description = "The name of the Azure Key Vault for dogs."
  type        = string
}

# Variable for dogs app Key Vault Resource Group Name
variable "keyvault_dogs_rg_name" {
  description = "The name of the Resource Group for the Azure Key Vault for dogs."
  type        = string
}

variable "dog_app_secrets" {
  type = map(string)
  default = {
    dogs-sql-server-name          = "testsqlvm-server-address"
    dogs-sql-server-username      = "testsqlvm-username"
    dogs-sql-server-port          = "azuresqlvm-port"
    dogs-sql-server-database-name = "azuresqlvm-db-name"
    dogs-sql-table-name           = "testsql-tablename"
    dogs-url-value                = ""
  }
}

variable "location" {
  type        = string
  description = "Location for resources to occur"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "The name of the Log Analytics workspace."
}

variable "recovery_services_vault_name" {
  type        = string
  description = "Name of the Recovery Services Vault."
}

variable "recovery_services_vault_rg" {
  type        = string
  description = "Name of the Resource Group for the Recovery Services Vault."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group for this workload, ensure that this is prefixed with rg"
}

variable "service_endpoints" {
  type        = list(string)
  description = "The list of Service endpoints to associate with the subnet."
  default     = []
}

variable "service_connection_id" {
  description = "The ID of the service principal."
  type        = string
}

variable "storage_acc_diag_name" {
  type        = string
  description = "Name of the Storage Account for sending VM bootdiag logs."
}

variable "storage_acc_diag_rg" {
  type        = string
  description = "Name of the Resource Group for the Storage Account for sending VM bootdiag logs."
}
variable "subnet_name" {
  type        = string
  description = "Name of the Subnet, ensure that this is prefixed with snet"
}

variable "containers_name" {
  type = string
}
variable "subscription_id" {
  description = "workload/spoke subscription id"
}

variable "hub_subscription_id" {
  description = "This subscription id where state file is located"
}

variable "tags_rg" {
  type        = map(string)
  default     = {}
  description = "Tags to be used for the Resource Group"
}

variable "tenant_id" {
  description = "Tenant id"
}

variable "virtual_network_name" {
  type        = string
  description = "Name of the Vnet under which the Subnet will be created."
}

variable "virtual_network_rg_name" {
  type        = string
  description = "Name of the Resource Group for the Vnet."
}
variable "functionAppName" {
  type        = string
  description = "Your Flex Consumption app name."
}

variable "serviceplan_name" {
  type        = string
  description = "Your Flex Consumption app name."
}

variable "functionPlanName" {
  description = "Your Flex Consumption plan name."
}
variable "smss_monitoring_appinsights" {
  description = "Your Flex Consumption plan name."
}
variable "data_collection_logs_table" {
  description = "Your Flex Consumption plan name."
}
variable "linux-storage-account" {
  type        = string
  description = "Your Flex Consumption app name."
}
variable "maximumInstanceCount" {
  default     = 100
  description = "The maximum instance count for the app"
}

variable "instanceMemoryMB" {
  default     = 2048
  description = "The instance memory for the instances of the app: 2048 or 4096"
}

variable "functionAppRuntime" {
  default     = "python"
  description = "The runtime for your app. One of the following: 'dotnet-isolated', 'python', 'java', 'node', 'powershell'"
}

variable "functionAppRuntimeVersion" {
  default     = "3.11"
  description = "The runtime and version for your app. One of the following: '3.10', '3.11', '7.4', '8.0', '10', '11', '17', '20'"
}

variable "vnet_routes" {
  type = list(object({
    prefix   = string
    next_hop = string
    hop_type = string
  }))
  description = "A list of local address spaces to add to route table and next hop"
  default     = []
}

# variable "storage_config" {
#   type = map(object({
#     storage_acc_name                  = string
#     location                          = string
#     resource_group_name               = string
#     enable_blob_soft_delete           = bool
#     enable_container_soft_delete      = bool
#     storage_acc_access_tier           = string
#     storage_acc_allow_nested_public   = bool
#     storage_acc_cross_tenant_enabled  = bool
#     storage_acc_enable_https_only     = bool
#     storage_acc_kind                  = string
#     storage_acc_public_access_enabled = bool
#     storage_acc_replication_type      = string
#     storage_acc_tier                  = string
#   }))
#   description = "Allows to specify the details for each Storage Account"

#   default = {}
# }
