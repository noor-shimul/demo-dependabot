nshimul@MMDJQR79K3:~/moj-repos/staff-infrastructure-azure-landing-zone/terraform$ tfsec --force-all-dirs

Result #1 CRITICAL Vault network ACL does not block access by default.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/infra-build/main.tf:38-47
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   38    resource "azurerm_key_vault" "vm_module_tests" {
   39      name                        = "kv-alz-vm-test-001"
   40      location                    = azurerm_resource_group.vm_module_tests.location
   41      resource_group_name         = azurerm_resource_group.vm_module_tests.name
   42      tenant_id                   = data.azurerm_client_config.vm_module_tests.tenant_id
   43      enabled_for_disk_encryption = true
   44      enable_rbac_authorization   = true
   45      sku_name                    = "standard"
   46      provider                    = azurerm.spoke
   47    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-specify-network-acl
      Impact Without a network ACL the key vault is freely accessible
  Resolution Set a network ACL for the key vault

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/specify-network-acl/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#network_acls
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #2 CRITICAL Storage account uses an insecure TLS version.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/infra-build/main.tf:74-84
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   74  ┌ resource "azurerm_storage_account" "vm_module_tests" {
   75  │   name                            = "stalzvmtest7272"
   76  │   location                        = azurerm_resource_group.vm_module_tests.location
   77  │   resource_group_name             = azurerm_resource_group.vm_module_tests.name
   78  │   account_tier                    = "Standard"
   79  │   account_kind                    = "StorageV2"
   80  │   account_replication_type        = "LRS"
   81  │   https_traffic_only_enabled      = true
   82  └   allow_nested_items_to_be_public = false
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-storage-use-secure-tls-policy
      Impact The TLS version being outdated and has known vulnerabilities
  Resolution Use a more recent TLS/SSL policy for the load balancer

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/storage/use-secure-tls-policy/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#min_tls_version
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #3 CRITICAL Vault network ACL does not block access by default.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/tests/terraform/infra-build/main.tf:38-47
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   38    resource "azurerm_key_vault" "vm_module_tests" {
   39      name                        = "kv-alz-vm-test-001"
   40      location                    = azurerm_resource_group.vm_module_tests.location
   41      resource_group_name         = azurerm_resource_group.vm_module_tests.name
   42      tenant_id                   = data.azurerm_client_config.vm_module_tests.tenant_id
   43      enabled_for_disk_encryption = true
   44      enable_rbac_authorization   = true
   45      sku_name                    = "standard"
   46      provider                    = azurerm.spoke
   47    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-specify-network-acl
      Impact Without a network ACL the key vault is freely accessible
  Resolution Set a network ACL for the key vault

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/specify-network-acl/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#network_acls
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #4 CRITICAL Storage account uses an insecure TLS version.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/tests/terraform/infra-build/main.tf:74-84
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   74  ┌ resource "azurerm_storage_account" "vm_module_tests" {
   75  │   name                            = "stalzvmtest7272"
   76  │   location                        = azurerm_resource_group.vm_module_tests.location
   77  │   resource_group_name             = azurerm_resource_group.vm_module_tests.name
   78  │   account_tier                    = "Standard"
   79  │   account_kind                    = "StorageV2"
   80  │   account_replication_type        = "LRS"
   81  │   https_traffic_only_enabled      = true
   82  └   allow_nested_items_to_be_public = false
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-storage-use-secure-tls-policy
      Impact The TLS version being outdated and has known vulnerabilities
  Resolution Use a more recent TLS/SSL policy for the load balancer

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/storage/use-secure-tls-policy/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#min_tls_version
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #5 CRITICAL Vault network ACL does not block access by default.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/tests/terraform/infra-build/main.tf:38-47
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   38    resource "azurerm_key_vault" "vm_module_tests" {
   39      name                        = "kv-alz-vm-test-001"
   40      location                    = azurerm_resource_group.vm_module_tests.location
   41      resource_group_name         = azurerm_resource_group.vm_module_tests.name
   42      tenant_id                   = data.azurerm_client_config.vm_module_tests.tenant_id
   43      enabled_for_disk_encryption = true
   44      enable_rbac_authorization   = true
   45      sku_name                    = "standard"
   46      provider                    = azurerm.spoke
   47    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-specify-network-acl
      Impact Without a network ACL the key vault is freely accessible
  Resolution Set a network ACL for the key vault

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/specify-network-acl/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#network_acls
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #6 CRITICAL Storage account uses an insecure TLS version.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/tests/terraform/infra-build/main.tf:74-84
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   74  ┌ resource "azurerm_storage_account" "vm_module_tests" {
   75  │   name                            = "stalzvmtest7272"
   76  │   location                        = azurerm_resource_group.vm_module_tests.location
   77  │   resource_group_name             = azurerm_resource_group.vm_module_tests.name
   78  │   account_tier                    = "Standard"
   79  │   account_kind                    = "StorageV2"
   80  │   account_replication_type        = "LRS"
   81  │   https_traffic_only_enabled      = true
   82  └   allow_nested_items_to_be_public = false
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-storage-use-secure-tls-policy
      Impact The TLS version being outdated and has known vulnerabilities
  Resolution Use a more recent TLS/SSL policy for the load balancer

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/storage/use-secure-tls-policy/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#min_tls_version
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #7 CRITICAL Vault network ACL does not block access by default.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/999-testing/01-infrastructure.tf:25-37
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   25  ┌ resource "azurerm_key_vault" "intern_vm" {
   26  │   name                        = var.kv_name
   27  │   location                    = azurerm_resource_group.intern_vm.location
   28  │   resource_group_name         = azurerm_resource_group.intern_vm.name
   29  │   tenant_id                   = var.tenant_id
   30  │   enabled_for_disk_encryption = true
   31  │   enable_rbac_authorization   = true
   32  │   sku_name                    = "standard"
   33  └   provider                    = azurerm.spoke
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-specify-network-acl
      Impact Without a network ACL the key vault is freely accessible
  Resolution Set a network ACL for the key vault

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/specify-network-acl/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#network_acls
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #8 CRITICAL Storage account uses an insecure TLS version.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/999-testing/01-infrastructure.tf:71-85
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   71  ┌ resource "azurerm_storage_account" "intern_vm" {
   72  │   name                             = var.storage_acct_name
   73  │   location                         = azurerm_resource_group.intern_vm.location
   74  │   resource_group_name              = azurerm_resource_group.intern_vm.name
   75  │   account_tier                     = "Standard"
   76  │   account_kind                     = "StorageV2"
   77  │   account_replication_type         = "LRS"
   78  │   https_traffic_only_enabled       = true
   79  └   allow_nested_items_to_be_public  = false
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-storage-use-secure-tls-policy
      Impact The TLS version being outdated and has known vulnerabilities
  Resolution Use a more recent TLS/SSL policy for the load balancer

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/storage/use-secure-tls-policy/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#min_tls_version
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #9 CRITICAL Vault network ACL does not block access by default.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/prod/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/infra-build/main.tf:38-47
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   38    resource "azurerm_key_vault" "vm_module_tests" {
   39      name                        = "kv-alz-vm-test-001"
   40      location                    = azurerm_resource_group.vm_module_tests.location
   41      resource_group_name         = azurerm_resource_group.vm_module_tests.name
   42      tenant_id                   = data.azurerm_client_config.vm_module_tests.tenant_id
   43      enabled_for_disk_encryption = true
   44      enable_rbac_authorization   = true
   45      sku_name                    = "standard"
   46      provider                    = azurerm.spoke
   47    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-specify-network-acl
      Impact Without a network ACL the key vault is freely accessible
  Resolution Set a network ACL for the key vault

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/specify-network-acl/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#network_acls
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #10 CRITICAL Storage account uses an insecure TLS version.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/prod/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/infra-build/main.tf:74-84
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   74  ┌ resource "azurerm_storage_account" "vm_module_tests" {
   75  │   name                            = "stalzvmtest7272"
   76  │   location                        = azurerm_resource_group.vm_module_tests.location
   77  │   resource_group_name             = azurerm_resource_group.vm_module_tests.name
   78  │   account_tier                    = "Standard"
   79  │   account_kind                    = "StorageV2"
   80  │   account_replication_type        = "LRS"
   81  │   enable_https_traffic_only       = true
   82  └   allow_nested_items_to_be_public = false
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-storage-use-secure-tls-policy
      Impact The TLS version being outdated and has known vulnerabilities
  Resolution Use a more recent TLS/SSL policy for the load balancer

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/storage/use-secure-tls-policy/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#min_tls_version
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #11-46 CRITICAL Storage account uses an insecure TLS version. (36 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/storageaccounts.tf:1-30
   via modules/version1.0.0/alz-spoke-workload/basic-spoke.tf:6-77 (module.spoke)
    via source/140-eucs/mojovd-003/main.tf:13-36 (module.full-spoke)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_storage_account" "oms" {
    2  │   name                             = var.storage_account_oms_name
    3  │   location                         = var.location
    4  │   resource_group_name              = var.resource_group_name
    5  │   account_tier                     = "Standard"
    6  │   account_kind                     = "StorageV2"
    7  │   account_replication_type         = "LRS"
    8  │   https_traffic_only_enabled       = true
    9  └   allow_nested_items_to_be_public  = false
   ..
────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-storage-use-secure-tls-policy
      Impact The TLS version being outdated and has known vulnerabilities
  Resolution Use a more recent TLS/SSL policy for the load balancer

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/storage/use-secure-tls-policy/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#min_tls_version
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #47-82 CRITICAL Storage account uses an insecure TLS version. (36 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/storageaccounts.tf:39-68
   via modules/version1.0.0/alz-spoke-workload/basic-spoke.tf:6-77 (module.spoke)
    via source/180-cvo/180-core.tf:13-36 (module.full-spoke)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   39  ┌ resource "azurerm_storage_account" "diagnostics" {
   40  │   name                             = var.storage_account_diagnostics_name
   41  │   location                         = var.location
   42  │   resource_group_name              = var.resource_group_name
   43  │   account_tier                     = "Standard"
   44  │   account_kind                     = "StorageV2"
   45  │   account_replication_type         = "LRS"
   46  │   https_traffic_only_enabled       = true
   47  └   allow_nested_items_to_be_public  = false
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-storage-use-secure-tls-policy
      Impact The TLS version being outdated and has known vulnerabilities
  Resolution Use a more recent TLS/SSL policy for the load balancer

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/storage/use-secure-tls-policy/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#min_tls_version
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #83-119 CRITICAL Vault network ACL does not block access by default. (37 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/submodules/terraform-azurerm-key-vault/main.tf:3-18
   via modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/keyvault.tf:9-36 (module.core_keyvault)
    via modules/version1.0.0/alz-spoke-workload/basic-spoke.tf:6-77 (module.spoke)
     via source/180-cvo/180-core.tf:13-36 (module.full-spoke)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    3  ┌ resource "azurerm_key_vault" "main" {
    4  │   name                = var.name
    5  │   location            = var.location
    6  │   resource_group_name = var.resource_group_name
    7  │   tenant_id           = data.azurerm_client_config.main.tenant_id
    8  │
    9  │   enabled_for_deployment          = var.enabled_for_deployment
   10  │   enabled_for_disk_encryption     = var.enabled_for_disk_encryption
   11  └   enabled_for_template_deployment = var.enabled_for_template_deployment
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-specify-network-acl
      Impact Without a network ACL the key vault is freely accessible
  Resolution Set a network ACL for the key vault

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/specify-network-acl/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#network_acls
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #120-121 CRITICAL Storage account uses an insecure TLS version. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/terraform-azurerm-paloalto-green/storageacc.tf:3-13
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    3  ┌ resource "azurerm_storage_account" "bootstrap" {
    4  │   name                      = var.fw_storage_account_name
    5  │   location                  = data.azurerm_resource_group.PAN_FW_RG.location
    6  │   resource_group_name       = data.azurerm_resource_group.PAN_FW_RG.name
    7  │   account_tier              = "Standard"
    8  │   account_kind              = "StorageV2"
    9  │   account_replication_type  = var.fw_storage_account_replication_type
   10  │   https_traffic_only_enabled = true
   11  └   cross_tenant_replication_enabled   = true
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - modules/version1.0.0/terraform-azurerm-paloalto-green/storageacc.tf:28-78 (module.palo-green)
  - modules/version1.0.0/terraform-azurerm-paloalto-green/storageacc.tf:3-13 (azurerm_storage_account.bootstrap)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-storage-use-secure-tls-policy
      Impact The TLS version being outdated and has known vulnerabilities
  Resolution Use a more recent TLS/SSL policy for the load balancer

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/storage/use-secure-tls-policy/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#min_tls_version
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #122-123 CRITICAL Vault network ACL does not block access by default. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-dogs-staging/keyvault.tf:1-12
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_key_vault" "workload" {
    2  │   name                        = var.keyvault_name
    3  │   location                    = azurerm_resource_group.workload.location
    4  │   resource_group_name         = azurerm_resource_group.workload.name
    5  │   tenant_id                   = var.tenant_id
    6  │   enabled_for_deployment      = true
    7  │   enabled_for_disk_encryption = true
    8  │   enable_rbac_authorization   = true
    9  └   sku_name                    = "premium"
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-dogs-staging/keyvault.tf:1-12 (azurerm_key_vault.workload) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-specify-network-acl
      Impact Without a network ACL the key vault is freely accessible
  Resolution Set a network ACL for the key vault

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/specify-network-acl/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#network_acls
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #124-126 CRITICAL Vault network ACL does not block access by default. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-dogs/keyvault.tf:1-12
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_key_vault" "workload" {
    2  │   name                        = var.keyvault_name
    3  │   location                    = azurerm_resource_group.workload.location
    4  │   resource_group_name         = azurerm_resource_group.workload.name
    5  │   tenant_id                   = var.tenant_id
    6  │   enabled_for_deployment      = true
    7  │   enabled_for_disk_encryption = true
    8  │   enable_rbac_authorization   = true
    9  └   sku_name                    = "premium"
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-dogs/keyvault.tf:1-12 (azurerm_key_vault.workload) 2 instances
  - source/210-smss/210-dogs/keyvault.tf:1-12 (azurerm_key_vault.workload)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-specify-network-acl
      Impact Without a network ACL the key vault is freely accessible
  Resolution Set a network ACL for the key vault

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/specify-network-acl/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#network_acls
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #127-128 CRITICAL Vault network ACL does not block access by default. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-ibase/keyvault.tf:1-12
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_key_vault" "workload" {
    2  │   name                        = var.keyvault_name
    3  │   location                    = var.location
    4  │   resource_group_name         = var.resource_group_name
    5  │   tenant_id                   = var.tenant_id
    6  │   enabled_for_deployment      = true
    7  │   enabled_for_disk_encryption = true
    8  │   enable_rbac_authorization   = true
    9  └   sku_name                    = "premium"
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-ibase/keyvault.tf:1-12 (azurerm_key_vault.workload) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-specify-network-acl
      Impact Without a network ACL the key vault is freely accessible
  Resolution Set a network ACL for the key vault

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/specify-network-acl/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#network_acls
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #129-131 CRITICAL Vault network ACL does not block access by default. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-monitoring/keyvault.tf:1-15
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_key_vault" "workload" {
    2  │   name                        = var.keyvault_name
    3  │   location                    = var.location
    4  │   resource_group_name         = var.resource_group_name
    5  │   tenant_id                   = var.tenant_id
    6  │   enabled_for_deployment      = true
    7  │   enabled_for_disk_encryption = true
    8  │   enable_rbac_authorization   = true
    9  └   sku_name                    = "standard"
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-monitoring/keyvault.tf:1-15 (azurerm_key_vault.workload) 2 instances
  - source/210-smss/210-monitoring/keyvault.tf:1-15 (azurerm_key_vault.workload)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-specify-network-acl
      Impact Without a network ACL the key vault is freely accessible
  Resolution Set a network ACL for the key vault

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/specify-network-acl/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#network_acls
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #132-134 CRITICAL Data factory allows public network access. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-ycs/adf.tf:1-17
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_data_factory" "ycs_adf" {
    2  │   name                = "${var.adf_name_prefix}-${var.env_suffix}"
    3  │   location            = azurerm_resource_group.rg.location
    4  │   resource_group_name = azurerm_resource_group.rg.name
    5  │
    6  │   managed_virtual_network_enabled = true
    7  │
    8  │   identity {
    9  └     type = "SystemAssigned"
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-ycs/adf.tf:1-17 (azurerm_data_factory.ycs_adf) 3 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-datafactory-no-public-access
      Impact Data factory is publicly accessible
  Resolution Set public access to disabled for Data Factory

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/datafactory/no-public-access/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#public_network_enabled
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #135-137 CRITICAL Storage account uses an insecure TLS version. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-ycs/storage.tf:2-15
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    2  ┌ resource "azurerm_storage_account" "storage" {
    3  │   name                            = "${var.storage_account_prefix}${var.env_suffix}"
    4  │   resource_group_name             = azurerm_resource_group.rg.name
    5  │   location                        = azurerm_resource_group.rg.location
    6  │   account_tier                    = "Standard"
    7  │   account_replication_type        = "LRS"
    8  │   allow_nested_items_to_be_public = false
    9  │
   10  └   provider = azurerm.spoke
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-ycs/storage.tf:2-15 (azurerm_storage_account.storage) 3 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-storage-use-secure-tls-policy
      Impact The TLS version being outdated and has known vulnerabilities
  Resolution Use a more recent TLS/SSL policy for the load balancer

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/storage/use-secure-tls-policy/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#min_tls_version
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #138-139 HIGH Linux virtual machine allows password authentication. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:109
   via environments/dev/100-hub/105-palo-alto-new.tf:131-141 (module.palo_alto_fw)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  101    resource "azurerm_linux_virtual_machine" "alz_linux" {
  ...
  109  [   disable_password_authentication                        = false (false)
  ...
  161    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:131-141 (module.palo_alto_fw) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-compute-disable-password-authentication
      Impact Using password authentication is less secure that ssh keys may result in compromised servers
  Resolution Use ssh authentication for virtual machines

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/compute/disable-password-authentication/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#disable_password_authentication
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#disable_password_authentication
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #140-141 HIGH Linux virtual machine allows password authentication. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:107
   via environments/prod/100-hub/105-palo-alto-new.tf:135-145 (module.palo_alto_fw)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   99    resource "azurerm_linux_virtual_machine" "alz_linux" {
  ...
  107  [   disable_password_authentication = false (false)
  ...
  158    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:135-145 (module.palo_alto_fw) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-compute-disable-password-authentication
      Impact Using password authentication is less secure that ssh keys may result in compromised servers
  Resolution Use ssh authentication for virtual machines

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/compute/disable-password-authentication/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#disable_password_authentication
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#disable_password_authentication
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #142-143 HIGH Linux virtual machine allows password authentication. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.11.0/alz-linux-vm/main.tf:109
   via source/140-eucs/150-wtp/manifest.tf:152-167 (module.sharegate_datadobi_linux_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  101    resource "azurerm_linux_virtual_machine" "alz_linux" {
  ...
  109  [   disable_password_authentication                        = false (false)
  ...
  162    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.11.0/alz-linux-vm/main.tf:152-167 (module.sharegate_datadobi_linux_vm)
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.11.0/alz-linux-vm/main.tf:152-167 (module.sharegate_datadobi_linux_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-compute-disable-password-authentication
      Impact Using password authentication is less secure that ssh keys may result in compromised servers
  Resolution Use ssh authentication for virtual machines

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/compute/disable-password-authentication/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#disable_password_authentication
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#disable_password_authentication
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #144 HIGH Linux virtual machine allows password authentication.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:109
   via environments/dev/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  101    resource "azurerm_linux_virtual_machine" "alz_linux" {
  ...
  109  [   disable_password_authentication                        = false (false)
  ...
  161    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-compute-disable-password-authentication
      Impact Using password authentication is less secure that ssh keys may result in compromised servers
  Resolution Use ssh authentication for virtual machines

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/compute/disable-password-authentication/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#disable_password_authentication
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#disable_password_authentication
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #145 HIGH Linux virtual machine allows password authentication.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/alz-linux-vm/main.tf:109
   via environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  101    resource "azurerm_linux_virtual_machine" "alz_linux" {
  ...
  109  [   disable_password_authentication                        = false (false)
  ...
  161    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-compute-disable-password-authentication
      Impact Using password authentication is less secure that ssh keys may result in compromised servers
  Resolution Use ssh authentication for virtual machines

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/compute/disable-password-authentication/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#disable_password_authentication
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#disable_password_authentication
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #146 HIGH Linux virtual machine allows password authentication.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/alz-linux-vm/main.tf:109
   via environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  101    resource "azurerm_linux_virtual_machine" "alz_linux" {
  ...
  109  [   disable_password_authentication                        = false (false)
  ...
  161    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-compute-disable-password-authentication
      Impact Using password authentication is less secure that ssh keys may result in compromised servers
  Resolution Use ssh authentication for virtual machines

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/compute/disable-password-authentication/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#disable_password_authentication
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#disable_password_authentication
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #147 HIGH Linux virtual machine allows password authentication.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:107
   via environments/prod/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   99    resource "azurerm_linux_virtual_machine" "alz_linux" {
  ...
  107  [   disable_password_authentication = false (false)
  ...
  158    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-compute-disable-password-authentication
      Impact Using password authentication is less secure that ssh keys may result in compromised servers
  Resolution Use ssh authentication for virtual machines

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/compute/disable-password-authentication/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#disable_password_authentication
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#disable_password_authentication
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #148-183 HIGH Network rules do not allow bypass for Microsoft Services. (36 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/storageaccounts.tf:22-26
   via modules/version1.0.0/alz-spoke-workload/basic-spoke.tf:6-77 (module.spoke)
    via source/200-emon/200-core.tf:13-36 (module.emon)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1    resource "azurerm_storage_account" "oms" {
    .
   22  ┌   network_rules {
   23  │     default_action             = var.storage_account_default_action
   24  │     ip_rules                   = var.storage_account_allowed_ips
   25  │     virtual_network_subnet_ids = var.vnet_subnet_ids
   26  └   }
   ..
   30    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-storage-allow-microsoft-service-bypass
      Impact Trusted Microsoft Services won't be able to access storage account unless rules set to allow
  Resolution Allow Trusted Microsoft Services to bypass

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/storage/allow-microsoft-service-bypass/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#bypass
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules#bypass
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #184-219 HIGH Network rules do not allow bypass for Microsoft Services. (36 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/storageaccounts.tf:60-64
   via modules/version1.0.0/alz-spoke-workload/basic-spoke.tf:6-77 (module.spoke)
    via source/120-sserv/124-core.tf:25-65 (module.sservcore)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   39    resource "azurerm_storage_account" "diagnostics" {
   ..
   60  ┌   network_rules {
   61  │     default_action             = var.storage_account_default_action                                        # set as default value to be Deny in this submodule
   62  │     ip_rules                   = concat(var.storage_account_allowed_ips, local.serial_console_service_ips) # comes from top level call to spoke module
   63  │     virtual_network_subnet_ids = var.vnet_subnet_ids                                                       # comes from top level call to spoke module. If not present, defaults to the core subnet that this module creates only
   64  └   }
   ..
   68    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-storage-allow-microsoft-service-bypass
      Impact Trusted Microsoft Services won't be able to access storage account unless rules set to allow
  Resolution Allow Trusted Microsoft Services to bypass

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/storage/allow-microsoft-service-bypass/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account#bypass
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules#bypass
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #220-222 HIGH Linux virtual machine allows password authentication. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/terraform-azurerm-paloalto-green/main.tf:80
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   21    resource "azurerm_virtual_machine" "PAN_FW_FW" {
   ..
   80  [     disable_password_authentication = false (false)
   ..
   93    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - modules/version1.0.0/terraform-azurerm-paloalto-green/main.tf:21-93 (azurerm_virtual_machine.PAN_FW_FW[0])
  - modules/version1.0.0/terraform-azurerm-paloalto-green/main.tf:28-78 (module.palo-green) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-compute-disable-password-authentication
      Impact Using password authentication is less secure that ssh keys may result in compromised servers
  Resolution Use ssh authentication for virtual machines

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/compute/disable-password-authentication/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#disable_password_authentication
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#disable_password_authentication
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #223-224 HIGH Linux virtual machine allows password authentication. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/170-ost/main.tf:95
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   88    resource "azurerm_linux_virtual_machine" "vm_ost" {
   ..
   95  [   disable_password_authentication = false (false)
  ...
  118    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/170-ost/main.tf:88-118 (azurerm_linux_virtual_machine.vm_ost) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-compute-disable-password-authentication
      Impact Using password authentication is less secure that ssh keys may result in compromised servers
  Resolution Use ssh authentication for virtual machines

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/compute/disable-password-authentication/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#disable_password_authentication
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#disable_password_authentication
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #225 HIGH Linux virtual machine allows password authentication.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  tests/module/terraform-azurerm-vmstopstart/main.tf:128
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  118    resource "azurerm_linux_virtual_machine" "vm_startstop_002" {
  ...
  128  [   disable_password_authentication = false (false)
  ...
  144    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-compute-disable-password-authentication
      Impact Using password authentication is less secure that ssh keys may result in compromised servers
  Resolution Use ssh authentication for virtual machines

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/compute/disable-password-authentication/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#disable_password_authentication
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#disable_password_authentication
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #226 HIGH Linux virtual machine allows password authentication.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  tests/module/terraform-azurerm-vmstopstart/main.tf:82
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_linux_virtual_machine" "vm_startstop_001" {
   ..
   82  [   disable_password_authentication = false (false)
  ...
  102    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-compute-disable-password-authentication
      Impact Using password authentication is less secure that ssh keys may result in compromised servers
  Resolution Use ssh authentication for virtual machines

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/compute/disable-password-authentication/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine#disable_password_authentication
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#disable_password_authentication
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #227 MEDIUM Vault does not have purge protection enabled.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/infra-build/main.tf:38-47
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   38    resource "azurerm_key_vault" "vm_module_tests" {
   39      name                        = "kv-alz-vm-test-001"
   40      location                    = azurerm_resource_group.vm_module_tests.location
   41      resource_group_name         = azurerm_resource_group.vm_module_tests.name
   42      tenant_id                   = data.azurerm_client_config.vm_module_tests.tenant_id
   43      enabled_for_disk_encryption = true
   44      enable_rbac_authorization   = true
   45      sku_name                    = "standard"
   46      provider                    = azurerm.spoke
   47    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-no-purge
      Impact Keys could be purged from the vault without protection
  Resolution Enable purge protection for key vaults

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/no-purge/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#purge_protection_enabled
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #228 MEDIUM Key should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/infra-build/main.tf:49-65
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   49  ┌ resource "azurerm_key_vault_key" "vm_module_tests" {
   50  │   name         = "diskEncryption"
   51  │   depends_on   = [azurerm_role_assignment.vm_module_tests]
   52  │   provider     = azurerm.spoke
   53  │   key_vault_id = azurerm_key_vault.vm_module_tests.id
   54  │   key_type     = "RSA"
   55  │   key_size     = 2048
   56  │
   57  └   key_opts = [
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-key-expiry
      Impact Long life keys increase the attack surface when compromised
  Resolution Set an expiration date on the vault key

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-key-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #229 MEDIUM Vault does not have purge protection enabled.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/tests/terraform/infra-build/main.tf:38-47
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   38    resource "azurerm_key_vault" "vm_module_tests" {
   39      name                        = "kv-alz-vm-test-001"
   40      location                    = azurerm_resource_group.vm_module_tests.location
   41      resource_group_name         = azurerm_resource_group.vm_module_tests.name
   42      tenant_id                   = data.azurerm_client_config.vm_module_tests.tenant_id
   43      enabled_for_disk_encryption = true
   44      enable_rbac_authorization   = true
   45      sku_name                    = "standard"
   46      provider                    = azurerm.spoke
   47    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-no-purge
      Impact Keys could be purged from the vault without protection
  Resolution Enable purge protection for key vaults

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/no-purge/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#purge_protection_enabled
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #230 MEDIUM Key should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/tests/terraform/infra-build/main.tf:49-65
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   49  ┌ resource "azurerm_key_vault_key" "vm_module_tests" {
   50  │   name         = "diskEncryption"
   51  │   depends_on   = [azurerm_role_assignment.vm_module_tests]
   52  │   provider     = azurerm.spoke
   53  │   key_vault_id = azurerm_key_vault.vm_module_tests.id
   54  │   key_type     = "RSA"
   55  │   key_size     = 2048
   56  │
   57  └   key_opts = [
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-key-expiry
      Impact Long life keys increase the attack surface when compromised
  Resolution Set an expiration date on the vault key

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-key-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #231 MEDIUM Vault does not have purge protection enabled.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/tests/terraform/infra-build/main.tf:38-47
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   38    resource "azurerm_key_vault" "vm_module_tests" {
   39      name                        = "kv-alz-vm-test-001"
   40      location                    = azurerm_resource_group.vm_module_tests.location
   41      resource_group_name         = azurerm_resource_group.vm_module_tests.name
   42      tenant_id                   = data.azurerm_client_config.vm_module_tests.tenant_id
   43      enabled_for_disk_encryption = true
   44      enable_rbac_authorization   = true
   45      sku_name                    = "standard"
   46      provider                    = azurerm.spoke
   47    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-no-purge
      Impact Keys could be purged from the vault without protection
  Resolution Enable purge protection for key vaults

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/no-purge/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#purge_protection_enabled
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #232 MEDIUM Key should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/tests/terraform/infra-build/main.tf:49-65
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   49  ┌ resource "azurerm_key_vault_key" "vm_module_tests" {
   50  │   name         = "diskEncryption"
   51  │   depends_on   = [azurerm_role_assignment.vm_module_tests]
   52  │   provider     = azurerm.spoke
   53  │   key_vault_id = azurerm_key_vault.vm_module_tests.id
   54  │   key_type     = "RSA"
   55  │   key_size     = 2048
   56  │
   57  └   key_opts = [
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-key-expiry
      Impact Long life keys increase the attack surface when compromised
  Resolution Set an expiration date on the vault key

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-key-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #233 MEDIUM Vault does not have purge protection enabled.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/999-testing/01-infrastructure.tf:25-37
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   25  ┌ resource "azurerm_key_vault" "intern_vm" {
   26  │   name                        = var.kv_name
   27  │   location                    = azurerm_resource_group.intern_vm.location
   28  │   resource_group_name         = azurerm_resource_group.intern_vm.name
   29  │   tenant_id                   = var.tenant_id
   30  │   enabled_for_disk_encryption = true
   31  │   enable_rbac_authorization   = true
   32  │   sku_name                    = "standard"
   33  └   provider                    = azurerm.spoke
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-no-purge
      Impact Keys could be purged from the vault without protection
  Resolution Enable purge protection for key vaults

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/no-purge/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#purge_protection_enabled
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #234 MEDIUM Key should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/999-testing/01-infrastructure.tf:39-55
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   39  ┌ resource "azurerm_key_vault_key" "intern_vm" {
   40  │   name         = "diskEncryption"
   41  │   depends_on   = [azurerm_role_assignment.intern_vm_kv]
   42  │   provider     = azurerm.spoke
   43  │   key_vault_id = azurerm_key_vault.intern_vm.id
   44  │   key_type     = "RSA"
   45  │   key_size     = 2048
   46  │
   47  └   key_opts = [
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-key-expiry
      Impact Long life keys increase the attack surface when compromised
  Resolution Set an expiration date on the vault key

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-key-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #235 MEDIUM Vault does not have purge protection enabled.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/prod/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/infra-build/main.tf:38-47
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   38    resource "azurerm_key_vault" "vm_module_tests" {
   39      name                        = "kv-alz-vm-test-001"
   40      location                    = azurerm_resource_group.vm_module_tests.location
   41      resource_group_name         = azurerm_resource_group.vm_module_tests.name
   42      tenant_id                   = data.azurerm_client_config.vm_module_tests.tenant_id
   43      enabled_for_disk_encryption = true
   44      enable_rbac_authorization   = true
   45      sku_name                    = "standard"
   46      provider                    = azurerm.spoke
   47    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-no-purge
      Impact Keys could be purged from the vault without protection
  Resolution Enable purge protection for key vaults

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/no-purge/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#purge_protection_enabled
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #236 MEDIUM Key should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/prod/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/infra-build/main.tf:49-65
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   49  ┌ resource "azurerm_key_vault_key" "vm_module_tests" {
   50  │   name         = "diskEncryption"
   51  │   depends_on   = [azurerm_role_assignment.vm_module_tests]
   52  │   provider     = azurerm.spoke
   53  │   key_vault_id = azurerm_key_vault.vm_module_tests.id
   54  │   key_type     = "RSA"
   55  │   key_size     = 2048
   56  │
   57  └   key_opts = [
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-key-expiry
      Impact Long life keys increase the attack surface when compromised
  Resolution Set an expiration date on the vault key

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-key-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #237-272 MEDIUM Key should have an expiry date specified. (36 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/keyvault.tf:49-67
   via modules/version1.0.0/alz-spoke-workload/basic-spoke.tf:6-77 (module.spoke)
    via source/100-hub/103-hub.tf:32-65 (module.hubcore)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   49  ┌ resource "azurerm_key_vault_key" "diskEncryption" {
   50  │   name         = "diskEncryption"
   51  │   depends_on   = [time_sleep.wait_30_seconds]
   52  │   key_vault_id = module.core_keyvault.id
   53  │   key_type     = "RSA"
   54  │   key_size     = 2048
   55  │
   56  │   key_opts = [
   57  └     "decrypt",
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-key-expiry
      Impact Long life keys increase the attack surface when compromised
  Resolution Set an expiration date on the vault key

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-key-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #273-309 MEDIUM Vault does not have purge protection enabled. (37 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/submodules/terraform-azurerm-key-vault/main.tf:3-18
   via modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/keyvault.tf:9-36 (module.core_keyvault)
    via modules/version1.0.0/alz-spoke-workload/basic-spoke.tf:6-77 (module.spoke)
     via source/100-hub/103-hub.tf:32-65 (module.hubcore)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    3  ┌ resource "azurerm_key_vault" "main" {
    4  │   name                = var.name
    5  │   location            = var.location
    6  │   resource_group_name = var.resource_group_name
    7  │   tenant_id           = data.azurerm_client_config.main.tenant_id
    8  │
    9  │   enabled_for_deployment          = var.enabled_for_deployment
   10  │   enabled_for_disk_encryption     = var.enabled_for_disk_encryption
   11  └   enabled_for_template_deployment = var.enabled_for_template_deployment
   ..
  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/no-purge/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#purge_protection_enabled
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #310-311 MEDIUM Vault does not have purge protection enabled. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-dogs-staging/keyvault.tf:1-12
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_key_vault" "workload" {
    2  │   name                        = var.keyvault_name
    3  │   location                    = azurerm_resource_group.workload.location
    4  │   resource_group_name         = azurerm_resource_group.workload.name
    5  │   tenant_id                   = var.tenant_id
    6  │   enabled_for_deployment      = true
    7  │   enabled_for_disk_encryption = true
    8  │   enable_rbac_authorization   = true
    9  └   sku_name                    = "premium"
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-dogs-staging/keyvault.tf:1-12 (azurerm_key_vault.workload) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-no-purge
      Impact Keys could be purged from the vault without protection
  Resolution Enable purge protection for key vaults

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/no-purge/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#purge_protection_enabled
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #312-313 MEDIUM Key should have an expiry date specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-dogs-staging/keyvault.tf:14-30
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   14  ┌ resource "azurerm_key_vault_key" "workload" {
   15  │   name         = "diskEncryption"
   16  │   depends_on   = [azurerm_role_assignment.workload]
   17  │   provider     = azurerm.spoke
   18  │   key_vault_id = azurerm_key_vault.workload.id
   19  │   key_type     = "RSA"
   20  │   key_size     = 2048
   21  │
   22  └   key_opts = [
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-dogs-staging/keyvault.tf:14-30 (azurerm_key_vault_key.workload) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-key-expiry
      Impact Long life keys increase the attack surface when compromised
  Resolution Set an expiration date on the vault key

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-key-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #314-316 MEDIUM Vault does not have purge protection enabled. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-dogs/keyvault.tf:1-12
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_key_vault" "workload" {
    2  │   name                        = var.keyvault_name
    3  │   location                    = azurerm_resource_group.workload.location
    4  │   resource_group_name         = azurerm_resource_group.workload.name
    5  │   tenant_id                   = var.tenant_id
    6  │   enabled_for_deployment      = true
    7  │   enabled_for_disk_encryption = true
    8  │   enable_rbac_authorization   = true
    9  └   sku_name                    = "premium"
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-dogs/keyvault.tf:1-12 (azurerm_key_vault.workload) 3 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-no-purge
      Impact Keys could be purged from the vault without protection
  Resolution Enable purge protection for key vaults

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/no-purge/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#purge_protection_enabled
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #317-319 MEDIUM Key should have an expiry date specified. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-dogs/keyvault.tf:14-30
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   14  ┌ resource "azurerm_key_vault_key" "workload" {
   15  │   name         = "diskEncryption"
   16  │   depends_on   = [azurerm_role_assignment.workload]
   17  │   provider     = azurerm.spoke
   18  │   key_vault_id = azurerm_key_vault.workload.id
   19  │   key_type     = "RSA"
   20  │   key_size     = 2048
   21  │
   22  └   key_opts = [
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-dogs/keyvault.tf:14-30 (azurerm_key_vault_key.workload) 3 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-key-expiry
      Impact Long life keys increase the attack surface when compromised
  Resolution Set an expiration date on the vault key

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-key-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #320-321 MEDIUM Vault does not have purge protection enabled. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-ibase/keyvault.tf:1-12
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_key_vault" "workload" {
    2  │   name                        = var.keyvault_name
    3  │   location                    = var.location
    4  │   resource_group_name         = var.resource_group_name
    5  │   tenant_id                   = var.tenant_id
    6  │   enabled_for_deployment      = true
    7  │   enabled_for_disk_encryption = true
    8  │   enable_rbac_authorization   = true
    9  └   sku_name                    = "premium"
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-ibase/keyvault.tf:1-12 (azurerm_key_vault.workload) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-no-purge
      Impact Keys could be purged from the vault without protection
  Resolution Enable purge protection for key vaults

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/no-purge/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#purge_protection_enabled
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #322-323 MEDIUM Key should have an expiry date specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-ibase/keyvault.tf:14-30
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   14  ┌ resource "azurerm_key_vault_key" "workload" {
   15  │   name         = "diskEncryption"
   16  │   depends_on   = [azurerm_role_assignment.workload]
   17  │   provider     = azurerm.spoke
   18  │   key_vault_id = azurerm_key_vault.workload.id
   19  │   key_type     = "RSA"
   20  │   key_size     = 2048
   21  │
   22  └   key_opts = [
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-ibase/keyvault.tf:14-30 (azurerm_key_vault_key.workload) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-key-expiry
      Impact Long life keys increase the attack surface when compromised
  Resolution Set an expiration date on the vault key

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-key-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #324-326 MEDIUM Vault does not have purge protection enabled. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-monitoring/keyvault.tf:1-15
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_key_vault" "workload" {
    2  │   name                        = var.keyvault_name
    3  │   location                    = var.location
    4  │   resource_group_name         = var.resource_group_name
    5  │   tenant_id                   = var.tenant_id
    6  │   enabled_for_deployment      = true
    7  │   enabled_for_disk_encryption = true
    8  │   enable_rbac_authorization   = true
    9  └   sku_name                    = "standard"
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-monitoring/keyvault.tf:1-15 (azurerm_key_vault.workload) 3 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-no-purge
      Impact Keys could be purged from the vault without protection
  Resolution Enable purge protection for key vaults

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/no-purge/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#purge_protection_enabled
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #327-329 MEDIUM Database server does not require a secure TLS version. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-ycs/azuresql.tf:1-22
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_mssql_server" "sqlserver" {
    2  │   name                = "${var.sql_server_prefix}-${var.env_suffix}"
    3  │   resource_group_name = azurerm_resource_group.rg.name
    4  │   location            = azurerm_resource_group.rg.location
    5  │   version             = "12.0"
    6  │
    7  │   # Authentication method: Entra ID Only
    8  │   azuread_administrator {
    9  └     login_username              = var.aad_admin_login
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-ycs/azuresql.tf:1-22 (azurerm_mssql_server.sqlserver) 2 instances
  - source/210-smss/210-ycs/azuresql.tf:1-22 (azurerm_mssql_server.sqlserver)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-database-secure-tls-policy
      Impact Outdated TLS policies increase exposure to known issues
  Resolution Use the most modern TLS policies available

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/database/secure-tls-policy/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server#minimum_tls_version
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_server#ssl_minimal_tls_version_enforced
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_server#ssl_minimal_tls_version_enforced
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #330-332 MEDIUM Server does not have an extended audit policy configured. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-ycs/azuresql.tf:1-22
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
    1  ┌ resource "azurerm_mssql_server" "sqlserver" {
    2  │   name                = "${var.sql_server_prefix}-${var.env_suffix}"
    3  │   resource_group_name = azurerm_resource_group.rg.name
    4  │   location            = azurerm_resource_group.rg.location
    5  │   version             = "12.0"
    6  │
    7  │   # Authentication method: Entra ID Only
    8  │   azuread_administrator {
    9  └     login_username              = var.aad_admin_login
   ..
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-ycs/azuresql.tf:1-22 (azurerm_mssql_server.sqlserver) 2 instances
  - source/210-smss/210-ycs/azuresql.tf:1-22 (azurerm_mssql_server.sqlserver)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-database-enable-audit
      Impact Auditing provides valuable information about access and usage
  Resolution Enable auditing on Azure SQL databases

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/database/enable-audit/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_server#extended_auditing_policy
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #333-334 LOW Secret does not have a content-type specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.0.8/alz-win-vm/main.tf:72-77
   via environments/dev/999-testing/03-vm.tf:1-15 (module.intern_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.0.8/alz-win-vm/main.tf:1-15 (module.intern_vm) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #335-336 LOW Secret should have an expiry date specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.0.8/alz-win-vm/main.tf:72-77
   via environments/dev/999-testing/03-vm.tf:1-15 (module.intern_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.0.8/alz-win-vm/main.tf:1-15 (module.intern_vm) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #337-338 LOW Secret does not have a content-type specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:67-72
   via environments/dev/100-hub/105-palo-alto-new.tf:131-141 (module.palo_alto_fw)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   67    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   68      for_each     = var.vm_specifications
   69      name         = "${each.key}-password"
   70      value        = random_password.alz_linux[each.key].result
   71      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   72    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:131-141 (module.palo_alto_fw) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #339-340 LOW Secret should have an expiry date specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:67-72
   via environments/dev/100-hub/105-palo-alto-new.tf:131-141 (module.palo_alto_fw)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   67    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   68      for_each     = var.vm_specifications
   69      name         = "${each.key}-password"
   70      value        = random_password.alz_linux[each.key].result
   71      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   72    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:131-141 (module.palo_alto_fw)
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:131-141 (module.palo_alto_fw)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #341-342 LOW Secret does not have a content-type specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:69-74
   via environments/prod/100-hub/105-palo-alto-new.tf:135-145 (module.palo_alto_fw)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   69    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   70      for_each     = var.vm_specifications
   71      name         = "${each.key}-password"
   72      value        = random_password.alz_linux[each.key].result
   73      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   74    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:135-145 (module.palo_alto_fw)
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:135-145 (module.palo_alto_fw)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #343-344 LOW Secret should have an expiry date specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:69-74
   via environments/prod/100-hub/105-palo-alto-new.tf:135-145 (module.palo_alto_fw)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   69    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   70      for_each     = var.vm_specifications
   71      name         = "${each.key}-password"
   72      value        = random_password.alz_linux[each.key].result
   73      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   74    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-linux-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:135-145 (module.palo_alto_fw) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #345 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/alz-win-vm/main.tf:72-77
   via source/210-smss/210-dogs/vm.tf:30-44 (module.workload_sql_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #346 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/alz-win-vm/main.tf:72-77
   via source/210-smss/210-dogs/vm.tf:30-44 (module.workload_sql_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #347 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/alz-win-vm/main.tf:72-77
   via source/210-smss/210-dogs/vm.tf:14-28 (module.workload_win_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #348 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/home/nshimul/moj-repos/staff-infrastructure-azure-landing-zone/terraform/environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/alz-win-vm/main.tf:72-77
   via source/210-smss/210-dogs/vm.tf:14-28 (module.workload_win_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #349-370 LOW Secret does not have a content-type specified. (22 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:72-77
   via source/140-eucs/150-wtp/manifest.tf:135-150 (module.sharegate_win_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:135-150 (module.sharegate_win_vm) 10 instances
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:1-12 (module.DOM1_DCs) 5 instances
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:30-44 (module.workload_sql_vm) 3 instances
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:14-28 (module.workload_win_vm) 2 instances
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:14-28 (module.workload_win_vm)
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:12-26 (module.exchange_win_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #371-392 LOW Secret should have an expiry date specified. (22 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:72-77
   via source/120-sserv/132-dom1dcs/main.tf:1-12 (module.DOM1_DCs)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:1-12 (module.DOM1_DCs) 5 instances
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:30-44 (module.workload_sql_vm) 3 instances
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:14-28 (module.workload_win_vm) 3 instances
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:12-26 (module.exchange_win_vm)
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:135-150 (module.sharegate_win_vm) 2 instances
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.10.0/alz-win-vm/main.tf:135-150 (module.sharegate_win_vm) 8 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #393-394 LOW Secret does not have a content-type specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.11.0/alz-linux-vm/main.tf:67-72
   via source/140-eucs/150-wtp/manifest.tf:152-167 (module.sharegate_datadobi_linux_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   67    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   68      for_each     = var.vm_specifications
   69      name         = "${each.key}-password"
   70      value        = random_password.alz_linux[each.key].result
   71      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   72    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.11.0/alz-linux-vm/main.tf:152-167 (module.sharegate_datadobi_linux_vm)
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.11.0/alz-linux-vm/main.tf:152-167 (module.sharegate_datadobi_linux_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #395-396 LOW Secret should have an expiry date specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.11.0/alz-linux-vm/main.tf:67-72
   via source/140-eucs/150-wtp/manifest.tf:152-167 (module.sharegate_datadobi_linux_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   67    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   68      for_each     = var.vm_specifications
   69      name         = "${each.key}-password"
   70      value        = random_password.alz_linux[each.key].result
   71      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   72    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.11.0/alz-linux-vm/main.tf:152-167 (module.sharegate_datadobi_linux_vm)
  - github.com/ministryofjustice/staff-infrastructure-alz-terraform-vm.git?ref=v2.11.0/alz-linux-vm/main.tf:152-167 (module.sharegate_datadobi_linux_vm)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #397 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:67-72
   via environments/dev/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   67    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   68      for_each     = var.vm_specifications
   69      name         = "${each.key}-password"
   70      value        = random_password.alz_linux[each.key].result
   71      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   72    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #398 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:67-72
   via environments/dev/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   67    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   68      for_each     = var.vm_specifications
   69      name         = "${each.key}-password"
   70      value        = random_password.alz_linux[each.key].result
   71      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   72    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #399 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-win-vm/main.tf:72-77
   via environments/dev/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/vm-build/main.tf:27-39 (module.windows_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #400 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/100-hub/.terraform/modules/palo_alto_fw/alz-win-vm/main.tf:72-77
   via environments/dev/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/vm-build/main.tf:27-39 (module.windows_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #401 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/alz-linux-vm/main.tf:67-72
   via environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   67    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   68      for_each     = var.vm_specifications
   69      name         = "${each.key}-password"
   70      value        = random_password.alz_linux[each.key].result
   71      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   72    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #402 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/alz-linux-vm/main.tf:67-72
   via environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   67    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   68      for_each     = var.vm_specifications
   69      name         = "${each.key}-password"
   70      value        = random_password.alz_linux[each.key].result
   71      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   72    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #403 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/alz-win-vm/main.tf:72-77
   via environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/tests/terraform/vm-build/main.tf:27-39 (module.windows_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #404 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/alz-win-vm/main.tf:72-77
   via environments/dev/210-smss/210-dogs/.terraform/modules/workload_sql_vm/tests/terraform/vm-build/main.tf:27-39 (module.windows_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #405 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/alz-linux-vm/main.tf:67-72
   via environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   67    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   68      for_each     = var.vm_specifications
   69      name         = "${each.key}-password"
   70      value        = random_password.alz_linux[each.key].result
   71      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   72    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #406 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/alz-linux-vm/main.tf:67-72
   via environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   67    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   68      for_each     = var.vm_specifications
   69      name         = "${each.key}-password"
   70      value        = random_password.alz_linux[each.key].result
   71      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   72    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #407 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/alz-win-vm/main.tf:72-77
   via environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/tests/terraform/vm-build/main.tf:27-39 (module.windows_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #408 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/alz-win-vm/main.tf:72-77
   via environments/dev/210-smss/210-dogs/.terraform/modules/workload_win_vm/tests/terraform/vm-build/main.tf:27-39 (module.windows_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #409 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:69-74
   via environments/prod/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   69    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   70      for_each     = var.vm_specifications
   71      name         = "${each.key}-password"
   72      value        = random_password.alz_linux[each.key].result
   73      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   74    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #410 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-linux-vm/main.tf:69-74
   via environments/prod/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/vm-build/main.tf:16-25 (module.linux_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   69    resource "azurerm_key_vault_secret" "alz_linux_passwords" {
   70      for_each     = var.vm_specifications
   71      name         = "${each.key}-password"
   72      value        = random_password.alz_linux[each.key].result
   73      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   74    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #411 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-win-vm/main.tf:72-77
   via environments/prod/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/vm-build/main.tf:27-39 (module.windows_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #412 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  environments/prod/100-hub/.terraform/modules/palo_alto_fw/alz-win-vm/main.tf:72-77
   via environments/prod/100-hub/.terraform/modules/palo_alto_fw/tests/terraform/vm-build/main.tf:27-39 (module.windows_vm_tests)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   72    resource "azurerm_key_vault_secret" "alz_win_passwords" {
   73      for_each     = var.vm_specifications
   74      name         = "${each.key}-password"
   75      value        = random_password.alz_win[each.key].result
   76      key_vault_id = data.azurerm_key_vault.core_spoke_keyvault.id
   77    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #413-664 LOW Security center subscription uses the free tier. (252 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/defenderforcloud.tf:16
   via modules/version1.0.0/alz-spoke-workload/basic-spoke.tf:6-77 (module.spoke)
    via source/120-sserv/124-core.tf:25-65 (module.sservcore)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   12    resource "azurerm_security_center_subscription_pricing" "main" {
   13      for_each = var.security_center_pricing_map
   14
   15      resource_type = each.key
   16  [   tier          = each.value.tier ("Free")
   17      subplan       = each.value.subplan
   18    }
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-security-center-enable-standard-subscription
      Impact Using free subscription does not enable Azure Defender for the resource type
  Resolution Enable standard subscription tier to benefit from Azure Defender

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/security-center/enable-standard-subscription/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing#tier
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #665-808 LOW Secret does not have a content-type specified. (144 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/submodules/terraform-azurerm-key-vault/main.tf:27-35
   via modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/keyvault.tf:9-36 (module.core_keyvault)
    via modules/version1.0.0/alz-spoke-workload/basic-spoke.tf:6-77 (module.spoke)
     via source/140-eucs/mojovd-003/main.tf:13-36 (module.full-spoke)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   27    resource "azurerm_key_vault_secret" "main" {
   28      for_each     = var.secrets
   29      name         = each.key
   30      value        = each.value
   31      key_vault_id = azurerm_key_vault.main.id
   32      depends_on = [
   33        azurerm_role_assignment.main
   34      ]
   35    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #809-952 LOW Secret should have an expiry date specified. (144 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/submodules/terraform-azurerm-key-vault/main.tf:27-35
   via modules/version1.0.0/alz-spoke-workload/submodules/spoke-create-from-scratch/keyvault.tf:9-36 (module.core_keyvault)
    via modules/version1.0.0/alz-spoke-workload/basic-spoke.tf:6-77 (module.spoke)
     via source/140-eucs/mojovd-002/main.tf:13-36 (module.full-spoke)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   27    resource "azurerm_key_vault_secret" "main" {
   28      for_each     = var.secrets
   29      name         = each.key
   30      value        = each.value
   31      key_vault_id = azurerm_key_vault.main.id
   32      depends_on = [
   33        azurerm_role_assignment.main
   34      ]
   35    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #953 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-dogs-staging/vm.tf:55-61
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   55    resource "azurerm_key_vault_secret" "sql_password" {
   56      for_each     = local.sql_vms
   57      name         = "${each.key}-sql-connectivity-password"
   58      value        = random_password.sql_password.result
   59      key_vault_id = data.azurerm_key_vault.workload.id
   60      provider     = azurerm.spoke
   61    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #954 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-dogs-staging/vm.tf:55-61
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   55    resource "azurerm_key_vault_secret" "sql_password" {
   56      for_each     = local.sql_vms
   57      name         = "${each.key}-sql-connectivity-password"
   58      value        = random_password.sql_password.result
   59      key_vault_id = data.azurerm_key_vault.workload.id
   60      provider     = azurerm.spoke
   61    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #955-956 LOW Secret does not have a content-type specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-dogs/vm.tf:55-61
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   55    resource "azurerm_key_vault_secret" "sql_password" {
   56      for_each     = local.sql_vms
   57      name         = "${each.key}-sql-connectivity-password"
   58      value        = random_password.sql_password.result
   59      key_vault_id = data.azurerm_key_vault.workload.id
   60      provider     = azurerm.spoke
   61    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-dogs/vm.tf:55-61 (azurerm_key_vault_secret.sql_password["vm-dogs-sql01"]) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #957-958 LOW Secret should have an expiry date specified. (2 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-dogs/vm.tf:55-61
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   55    resource "azurerm_key_vault_secret" "sql_password" {
   56      for_each     = local.sql_vms
   57      name         = "${each.key}-sql-connectivity-password"
   58      value        = random_password.sql_password.result
   59      key_vault_id = data.azurerm_key_vault.workload.id
   60      provider     = azurerm.spoke
   61    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-dogs/vm.tf:55-61 (azurerm_key_vault_secret.sql_password["vm-dogs-sql01"]) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #959 LOW Secret does not have a content-type specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-ibase/vm.tf:55-61
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   55    resource "azurerm_key_vault_secret" "sql_password" {
   56      for_each     = local.sql_vms
   57      name         = "${each.key}-sql-connectivity-password"
   58      value        = random_password.sql_password.result
   59      key_vault_id = data.azurerm_key_vault.workload.id
   60      provider     = azurerm.spoke
   61    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Result #960 LOW Secret should have an expiry date specified.
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-ibase/vm.tf:55-61
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   55    resource "azurerm_key_vault_secret" "sql_password" {
   56      for_each     = local.sql_vms
   57      name         = "${each.key}-sql-connectivity-password"
   58      value        = random_password.sql_password.result
   59      key_vault_id = data.azurerm_key_vault.workload.id
   60      provider     = azurerm.spoke
   61    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #961-963 LOW Secret does not have a content-type specified. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-monitoring/keyvault.tf:54-60
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   54    resource "azurerm_key_vault_secret" "vm-monitoring-app-password001" {
   55      depends_on   = [azurerm_role_assignment.kv_read_to_sp]
   56      name         = data.azurerm_key_vault_secret.vm-dogs-app01-password.name
   57      value        = data.azurerm_key_vault_secret.vm-dogs-app01-password.value
   58      key_vault_id = azurerm_key_vault.workload.id
   59      provider     = azurerm.spoke
   60    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-monitoring/keyvault.tf:54-60 (azurerm_key_vault_secret.vm-monitoring-app-password001) 3 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #964-966 LOW Secret should have an expiry date specified. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-monitoring/keyvault.tf:54-60
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   54    resource "azurerm_key_vault_secret" "vm-monitoring-app-password001" {
   55      depends_on   = [azurerm_role_assignment.kv_read_to_sp]
   56      name         = data.azurerm_key_vault_secret.vm-dogs-app01-password.name
   57      value        = data.azurerm_key_vault_secret.vm-dogs-app01-password.value
   58      key_vault_id = azurerm_key_vault.workload.id
   59      provider     = azurerm.spoke
   60    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-monitoring/keyvault.tf:54-60 (azurerm_key_vault_secret.vm-monitoring-app-password001)
  - source/210-smss/210-monitoring/keyvault.tf:54-60 (azurerm_key_vault_secret.vm-monitoring-app-password001) 2 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #967-969 LOW Secret does not have a content-type specified. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-monitoring/keyvault.tf:61-67
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   61    resource "azurerm_key_vault_secret" "vm-dogs-sql01-password" {
   62      depends_on   = [azurerm_role_assignment.kv_read_to_sp]
   63      name         = data.azurerm_key_vault_secret.vm-dogs-sql01-password.name
   64      value        = data.azurerm_key_vault_secret.vm-dogs-sql01-password.value
   65      key_vault_id = azurerm_key_vault.workload.id
   66      provider     = azurerm.spoke
   67    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-monitoring/keyvault.tf:61-67 (azurerm_key_vault_secret.vm-dogs-sql01-password) 3 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #970-972 LOW Secret should have an expiry date specified. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-monitoring/keyvault.tf:61-67
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   61    resource "azurerm_key_vault_secret" "vm-dogs-sql01-password" {
   62      depends_on   = [azurerm_role_assignment.kv_read_to_sp]
   63      name         = data.azurerm_key_vault_secret.vm-dogs-sql01-password.name
   64      value        = data.azurerm_key_vault_secret.vm-dogs-sql01-password.value
   65      key_vault_id = azurerm_key_vault.workload.id
   66      provider     = azurerm.spoke
   67    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-monitoring/keyvault.tf:61-67 (azurerm_key_vault_secret.vm-dogs-sql01-password) 2 instances
  - source/210-smss/210-monitoring/keyvault.tf:61-67 (azurerm_key_vault_secret.vm-dogs-sql01-password)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #973-975 LOW Secret does not have a content-type specified. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-monitoring/keyvault.tf:68-74
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   68    resource "azurerm_key_vault_secret" "vm-dogs-sql01-sql-connectivity-password" {
   69      depends_on   = [azurerm_role_assignment.kv_read_to_sp]
   70      name         = data.azurerm_key_vault_secret.vm-dogs-sql01-sql-connectivity-password.name
   71      value        = data.azurerm_key_vault_secret.vm-dogs-sql01-sql-connectivity-password.value
   72      key_vault_id = azurerm_key_vault.workload.id
   73      provider     = azurerm.spoke
   74    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-monitoring/keyvault.tf:68-74 (azurerm_key_vault_secret.vm-dogs-sql01-sql-connectivity-password) 3 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #976-978 LOW Secret should have an expiry date specified. (3 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-monitoring/keyvault.tf:68-74
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   68    resource "azurerm_key_vault_secret" "vm-dogs-sql01-sql-connectivity-password" {
   69      depends_on   = [azurerm_role_assignment.kv_read_to_sp]
   70      name         = data.azurerm_key_vault_secret.vm-dogs-sql01-sql-connectivity-password.name
   71      value        = data.azurerm_key_vault_secret.vm-dogs-sql01-sql-connectivity-password.value
   72      key_vault_id = azurerm_key_vault.workload.id
   73      provider     = azurerm.spoke
   74    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  Individual Causes
  - source/210-smss/210-monitoring/keyvault.tf:68-74 (azurerm_key_vault_secret.vm-dogs-sql01-sql-connectivity-password) 3 instances
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-ensure-secret-expiry
      Impact Long life secrets increase the opportunity for compromise
  Resolution Set an expiry for secrets

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/ensure-secret-expiry/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#expiration_date
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #979-996 LOW Secret does not have a content-type specified. (18 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-monitoring/keyvault.tf:76-83
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   76    resource "azurerm_key_vault_secret" "sql_secrets" {
   77      for_each = var.dog_app_secrets
   78
   79      name         = each.key
   80      value        = each.value
   81      key_vault_id = azurerm_key_vault.workload.id
   82      provider     = azurerm.spoke
   83    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
          ID azure-keyvault-content-type-for-secret
      Impact The secret's type is unclear without a content type
  Resolution Provide content type for secrets to aid interpretation on retrieval

  More Information
  - https://aquasecurity.github.io/tfsec/v1.28.14/checks/azure/keyvault/content-type-for-secret/
  - https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret#content_type
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────


Results #997-1014 LOW Secret should have an expiry date specified. (18 similar results)
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
  source/210-smss/210-monitoring/keyvault.tf:76-83
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   76    resource "azurerm_key_vault_secret" "sql_secrets" {
   77      for_each = var.dog_app_secrets
   78
   79      name         = each.key
   80      value        = each.value
   81      key_vault_id = azurerm_key_vault.workload.id
   82      provider     = azurerm.spoke
   83    }
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

  results
  ──────────────────────────────────────────
  passed               639
  ignored              0
  critical             137
  high                 89
  medium               106
  low                  682

  639 passed, 1014 potential problem(s) detected.

nshimul@MMDJQR79K3:~/moj-repos/staff-infrastructure-azure-landing-zone/terraform$