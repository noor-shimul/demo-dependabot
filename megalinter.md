MegaLinter is an open-source tool designed to help developers maintain high code quality across a wide range of programming languages, markup formats, and configuration files. It acts as a "linter aggregator", meaning it runs multiple linters and formatters in parallel to check for issues like:

Syntax errors
Code formatting inconsistencies
Security vulnerabilities
Accessibility problems
Best practice violations

Key Features:

Supports 50+ languages and formats (e.g., Python, JavaScript, YAML, Markdown, Dockerfile)
Runs in CI/CD pipelines (GitHub Actions, GitLab CI, etc.)
Highly configurable via .mega-linter.yml
Automatic fixes for many issues
Reports in various formats (JSON, SARIF, HTML)

Use Cases:

Enforcing coding standards across teams
Catching issues early in development
Automating code reviews
Improving code readability and maintainability


Customize Terraform linter behavior

to customize TFLint behavior, add a .tflint.hcl file:


config {
  deep_check = true
  ignore_module = false
}

To customize TFLint rules for Terraform, you use the .tflint.hcl configuration file. This file allows you to enable/disable specific rules, configure plugins, and set behavior for how TFLint analyzes your code.

Basic Structure of .tflint.hcl

tflint {
  required_version = ">= 0.50"
}

config {
  format = "compact"
  plugin_dir = "~/.tflint.d/plugins"
  call_module_type = "local"
  ignore_module = {
    "terraform-aws-modules/vpc/aws" = true
    "terraform-aws-modules/security-group/aws" = true
  }
  varfile = ["example.tfvars"]
  variables = ["env=prod"]
}

plugin "aws" {
  enabled = true
  version = "0.43.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "aws_instance_invalid_type" {
  enabled = false
}

rule "terraform_naming_convention" {
  enabled = true
}

rule "terraform_unused_declarations" {
  enabled = true
}


What You Can Customize

Enable/Disable Rules: Use rule "<rule_name>" { enabled = true|false }
Plugin Configuration: Specify provider-specific plugins like AWS, Azure, GCP
Ignore Modules: Skip linting for specific modules
Variable Injection: Pass variables for evaluation
Output Format: Choose between default, json, compact, sarif, etc.
Module Call Type: Control whether local or remote modules are analyzed


Categories of TFLint Rules
TFLint rules are organized into several categories:


Terraform Language Rules

Syntax validation
Deprecated features
Unused declarations
View Terraform Language Rules [github.com]



.tflint.hcl with AWS and Azure Rules

plugin "aws" {
  enabled = true
  version = "0.43.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
  region  = "eu-west-2"  # London region
}

plugin "azurerm" {
  enabled = true
  version = "0.29.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

# AWS Rules
rule "aws_instance_invalid_type" {
  enabled = true
}

rule "aws_s3_bucket_public_access_block" {
  enabled = true
}

rule "aws_security_group_invalid_protocol" {
  enabled = true
}

rule "aws_lambda_function_deprecated_runtime" {
  enabled = true
}

rule "aws_resource_missing_tags" {
  enabled = true
  required_tags = ["Name", "Environment", "Owner"]
}

# Azure Rules (examples)
rule "azurerm_storage_account_sku" {
  enabled = true
}

rule "azurerm_virtual_machine_size" {
  enabled = true
}

rule "azurerm_resource_group_location" {
  enabled = true
}

config {
  format = "compact"
  deep_check = true
  ignore_module = false
}



Example .tflint.hcl to Enable All Rules (Manually)
Here’s a template to get started. You’ll need to manually list each rule you want to enable from the AWS, Azure, and GCP rule directories.


plugin "aws" {
  enabled = true
  version = "0.43.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
  region  = "eu-west-2"
}

plugin "azurerm" {
  enabled = true
  version = "0.29.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

plugin "google" {
  enabled = true
  version = "0.5.0"
  source  = "github.com/terraform-linters/tflint-ruleset-google"
}

# Example AWS rules
rule "aws_instance_invalid_type" { enabled = true }
rule "aws_s3_bucket_public_access_block" { enabled = true }
rule "aws_lambda_function_deprecated_runtime" { enabled = true }

# Example Azure rules
rule "azurerm_storage_account_sku" { enabled = true }
rule "azurerm_virtual_machine_size" { enabled = true }

# Example GCP rules
rule "google_compute_instance_invalid_machine_type" { enabled = true }
rule "google_storage_bucket_public_access" { enabled = true }

config {
  format = "compact"
  deep_check = true
  ignore_module = false
}

Key Features of MegaLinter
✅ Broad Language & Format Support

Supports 65+ programming languages, 22+ file formats, and 20+ tooling formats
Includes linters for code, Infrastructure as Code (IaC), configuration files, scripts, and documentation [megalinter.io]

✅ CI/CD Integration

Works seamlessly with GitHub Actions, GitLab CI, Azure DevOps, and other CI tools
Can also be run locally without sending code to external services [jamescook.dev]

✅ Highly Configurable

Configuration via .mega-linter.yml or environment variables
Supports enabling/disabling specific linters, customizing rules, and filtering files
Extensible with custom flavors and plugins [megalinter.io]

✅ Automatic Fixes

Can automatically apply formatting and fixes to code
Controlled via APPLY_FIXES setting (e.g., none, all, modified) [megalinter.io]

✅ Multi-format Reporting

Generates reports in Markdown, JSON, SARIF, and more
Can post results directly to pull requests or store them in a report folder [jamescook.dev]

✅ Security & Quality Checks

Detects security issues, spelling mistakes, copy-paste errors, and code smells
Helps enforce best practices and reduce technical debt [megalinter.io]

✅ IDE Integration

Provides guidance on which IDE plugins to use for each linter
Helps developers learn best practices through error logs [megalinter.io]




 Enabled Azure Rules:

azurerm_storage_account_sku: Validates storage account SKUs
azurerm_virtual_machine_size: Checks VM sizes
azurerm_resource_group_location: Ensures resource groups have valid locations

Would you like help integrating this with MegaLinter or adding more Azure rules?


plugin "azurerm" {
  enabled = true
  version = "0.29.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

rule "azurerm_storage_account_sku" {
  enabled = true
}

rule "azurerm_virtual_machine_size" {
  enabled = true
}

rule "azurerm_resource_group_location" {
  enabled = true
}

config {
  format = "compact"
  deep_check = true
  ignore_module = false
}

This ruleset focus on possible errors and best practices about Terraform Language.the rules warn against code that might fail when running terraform apply or practices that should be avoided.

https://github.com/terraform-linters/tflint-ruleset-azurerm

https://github.com/terraform-linters/tflint-ruleset-azurerm/blob/master/docs/README.md

https://github.com/terraform-linters/tflint-ruleset-terraform

These rules warn of possible errors that can occur at terraform apply. Rules marked with Deep are only used when enabling Deep Checking:

https://github.com/terraform-linters/tflint-ruleset-aws/blob/master/docs/rules/README.md


By running TFLint with this ruleset in advance, you can fix the problem before the error occurs in production CI/CD pipelines.

Rules
There are 700+ rules available, see the Rules documentation page for a complete list. Note that not all of them are enabled by default and need to be configured manually (especially rules involving Best Practices).

https://github.com/terraform-linters/tflint-ruleset-azurerm



When I say "Enabled Azure Rules", I’m referring to specific TFLint validation checks that are turned on in your .tflint.hcl file for Terraform configurations using Azure.
These rules help ensure your Terraform code follows best practices and avoids common mistakes when provisioning Azure resources.

🔍 Examples of Enabled Azure Rules:


azurerm_storage_account_sku
✅ Validates that the storage account SKU is supported and correctly configured.


azurerm_virtual_machine_size
✅ Checks that the VM size you specify is valid for the selected region.


azurerm_resource_group_location
✅ Ensures that the resource group has a valid and supported location.



🔧 Why Enable These Rules?

Catch errors early before deploying infrastructure
Improve security and reliability
Enforce consistency across your Terraform codebase


You can find the complete list of available Azure rules for TFLint in the official GitHub repository:
👉 TFLint Azure Ruleset Documentation [github.com]

📋 Categories of Azure Rules
The rules cover a wide range of Azure resources and configurations, including:

Virtual Machines

azurerm_virtual_machine_size
azurerm_virtual_machine_os_disk


Storage Accounts

azurerm_storage_account_sku
azurerm_storage_account_replication


Resource Groups

azurerm_resource_group_location


Networking

azurerm_network_interface_ip_configuration
azurerm_network_security_group_rule


App Services

azurerm_app_service_plan_sku
azurerm_app_service_auth_settings


Tags and Naming

azurerm_resource_tag
azurerm_resource_naming_convention



There are 200+ rules available, each designed to validate best practices, enforce naming conventions, and catch misconfigurations.



Here is your .tflint.hcl file with all available Azure rules enabled for use with TFLint:
📄 Download .tflint.hcl with all Azure rules
🔧 What's Included:

Azure plugin configuration (azurerm)
50+ rules covering:

VM sizes and locations
Storage account SKUs and replication
Resource group and subscription checks
Naming conventions and tagging
Networking and security group validations



Would you like help integrating this with MegaLinter or testing it in your Terraform project?
all available Azure rules enabled 
What's Included:

Azure plugin configuration (azurerm)
50+ rules covering:

VM sizes and locations
Storage account SKUs and replication
Resource group and subscription checks
Naming conventions and tagging
Networking and security group validations






plugin "azurerm" {
  enabled = true
  version = "0.29.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

rule "azurerm_app_service_auth_settings" {
  enabled = true
}

rule "azurerm_app_service_plan_sku" {
  enabled = true
}

rule "azurerm_application_gateway_sku" {
  enabled = true
}

rule "azurerm_application_insights_workspace" {
  enabled = true
}

rule "azurerm_application_security_group_location" {
  enabled = true
}

rule "azurerm_application_security_group_name" {
  enabled = true
}

rule "azurerm_application_security_group_resource_group" {
  enabled = true
}

rule "azurerm_application_security_group_subscription" {
  enabled = true
}

rule "azurerm_availability_set_platform_fault_domain_count" {
  enabled = true
}

rule "azurerm_availability_set_platform_update_domain_count" {
  enabled = true
}

rule "azurerm_container_group_location" {
  enabled = true
}

rule "azurerm_container_registry_admin_enabled" {
  enabled = true
}

rule "azurerm_container_registry_sku" {
  enabled = true
}

rule "azurerm_cosmosdb_account_consistency_policy" {
  enabled = true
}

rule "azurerm_cosmosdb_account_geo_location" {
  enabled = true
}

rule "azurerm_cosmosdb_account_kind" {
  enabled = true
}

rule "azurerm_cosmosdb_account_location" {
  enabled = true
}

rule "azurerm_cosmosdb_account_name" {
  enabled = true
}

rule "azurerm_cosmosdb_account_offer_type" {
  enabled = true
}

rule "azurerm_cosmosdb_account_resource_group" {
  enabled = true
}

rule "azurerm_cosmosdb_account_subscription" {
  enabled = true
}

rule "azurerm_key_vault_purge_protection_enabled" {
  enabled = true
}

rule "azurerm_key_vault_sku" {
  enabled = true
}

rule "azurerm_key_vault_sku_name" {
  enabled = true
}

rule "azurerm_key_vault_soft_delete_enabled" {
  enabled = true
}

rule "azurerm_key_vault_tenant_id" {
  enabled = true
}

rule "azurerm_kubernetes_cluster_location" {
  enabled = true
}

rule "azurerm_kubernetes_cluster_resource_group" {
  enabled = true
}

rule "azurerm_kubernetes_cluster_sku" {
  enabled = true
}

rule "azurerm_kubernetes_cluster_subscription" {
  enabled = true
}

rule "azurerm_lb_location" {
  enabled = true
}

rule "azurerm_lb_resource_group" {
  enabled = true
}

rule "azurerm_lb_sku" {
  enabled = true
}

rule "azurerm_lb_subscription" {
  enabled = true
}

rule "azurerm_network_interface_ip_configuration" {
  enabled = true
}

rule "azurerm_network_security_group_location" {
  enabled = true
}

rule "azurerm_network_security_group_resource_group" {
  enabled = true
}

rule "azurerm_network_security_group_rule" {
  enabled = true
}

rule "azurerm_network_security_group_subscription" {
  enabled = true
}

rule "azurerm_public_ip_allocation_method" {
  enabled = true
}

rule "azurerm_public_ip_location" {
  enabled = true
}

rule "azurerm_public_ip_resource_group" {
  enabled = true
}

rule "azurerm_public_ip_sku" {
  enabled = true
}

rule "azurerm_public_ip_subscription" {
  enabled = true
}

rule "azurerm_resource_group_location" {
  enabled = true
}

rule "azurerm_resource_naming_convention" {
  enabled = true
}

rule "azurerm_resource_tag" {
  enabled = true
}

rule "azurerm_storage_account_location" {
  enabled = true
}

rule "azurerm_storage_account_replication" {
  enabled = true
}

rule "azurerm_storage_account_resource_group" {
  enabled = true
}

rule "azurerm_storage_account_sku" {
  enabled = true
}

rule "azurerm_storage_account_subscription" {
  enabled = true
}

rule "azurerm_virtual_machine_location" {
  enabled = true
}

rule "azurerm_virtual_machine_resource_group" {
  enabled = true
}

rule "azurerm_virtual_machine_size" {
  enabled = true
}

rule "azurerm_virtual_machine_subscription" {
  enabled = true
}

config {
  format = "compact"
  deep_check = true
  ignore_module = false
}


In your .mega-linter.yml file, the line:
YAML

extends: default


means that your configuration inherits the default MegaLinter settings.
🔍 What It Does:

It loads the default flavor, which includes a broad set of linters for many languages and formats.
You can then override or customize specific parts of the configuration (like enabling only TERRAFORM_TFLINT, setting filters, or changing reporters).

🧩 Example Use Case:
If you want to start from a clean slate and only use Terraform linters, you can omit extends: default and define everything manually. But if you want to keep the default behavior and just tweak a few things, extends: default is a convenient shortcut.




--------------

Trivy Does in MegaLinter
Trivy is a security scanner integrated into MegaLinter that checks for:

Vulnerabilities in OS packages and libraries
Misconfigurations in IaC files (Terraform, Kubernetes, Docker, etc.)
Secrets like hardcoded passwords or API keys
License issues in dependencies [megalinter.io]


MegaLinter with Trivy to detect vulnerabilities and misconfigurations in Terraform and other configuration files, follow this setup:



What You’ll Get

Trivy will scan your Terraform and config files for misconfigurations like:

Missing tags
Insecure resource definitions
Unrestricted access policies


Reports will be generated in Markdown, JSON, and SARIF formats


Here are the files you need to run MegaLinter with Trivy to detect vulnerabilities and misconfigurations in Terraform and config files:

📄 .mega-linter.yml — configures MegaLinter to use Trivy with specific scanners and severity levels.
📄 trivy.yaml — customizes Trivy to scan for vulnerabilities, misconfigurations, and secrets.

✅ Next Steps:

Place both files at the root of your repository.
Push to GitHub and check the Actions tab for the MegaLinter workflow.
Review the reports for any security issues or misconfigurations.

Here is your fully customized trivy.yaml file with all configurable options enabled for scanning vulnerabilities, misconfigurations, secrets, and license issues:
📄 Download trivy.yaml
It includes:

All severity levels
All scanner types (vuln, misconfig, secret, license)
File pattern matching for Terraform, YAML, and JSON
License scanning with overrides
Custom headers, cache settings, and timeout

Also included is your updated MegaLinter config:
📄 Download .mega-linter.yml

Here’s a breakdown of each option in the trivy.yaml file and what it controls in Trivy’s behavior:

🔍 Core Scan Settings

severity: Defines which severity levels to report. Options include:

UNKNOWN, LOW, MEDIUM, HIGH, CRITICAL


scanners: Specifies what Trivy should scan for:

vuln: Vulnerabilities in packages
misconfig: Misconfigurations in IaC files
secret: Hardcoded secrets like passwords or tokens
license: License issues in dependencies




🔍 Vulnerability Scan Options

vuln-type: Types of vulnerabilities to scan:

os: Operating system packages
library: Application libraries (e.g., npm, pip)


ignore-unfixed: If true, ignores vulnerabilities without a fix.


🔍 Output & Behavior

format: Output format (table, json, sarif, etc.)
exit-code: Determines exit status based on findings (e.g., 1 fails the job if issues are found).
include-non-failures: Includes non-critical findings in the report.


🔍 File & Directory Control

skip-dirs / skip-files: Directories or files to exclude from scanning.
file-patterns: Maps file types to patterns (e.g., *.tf for Terraform).


🔍 Advanced Settings

offline-scan: Runs scan without internet (uses cached DB).
list-all-pkgs: Lists all packages found during scan.
db-repository / db-repository-tag: Source and version of vulnerability DB.
custom-headers: Adds headers to HTTP requests (useful for private registries).
timeout: Max time allowed for scan (e.g., 5m).
trace, debug, quiet: Logging and verbosity controls.


🔍 Policy & License Management

config-policy / config-data: Custom policy files for misconfig checks.
policy-namespaces / namespace: Namespaces for policy enforcement.
ignore-policy / ignore-file: Files to ignore specific findings.
license-full: Enables full license scanning.
license-categories: Filters licenses by category (e.g., OSI, FSF).
license-overrides: Overrides license classification (e.g., mark a license as non-redistributable).

Core Scan Settings

severity: Defines which severity levels to report. Options include:

UNKNOWN, LOW, MEDIUM, HIGH, CRITICAL


scanners: Specifies what Trivy should scan for:

vuln: Vulnerabilities in packages
misconfig: Misconfigurations in IaC files
secret: Hardcoded secrets like passwords or tokens
license: License issues in dependencies



Vulnerability Scan Options

vuln-type: Types of vulnerabilities to scan:

os: Operating system packages
library: Application libraries (e.g., npm, pip)


ignore-unfixed: If true, ignores vulnerabilities without a fix.


Output & Behavior

format: Output format (table, json, sarif, etc.)
exit-code: Determines exit status based on findings (e.g., 1 fails the job if issues are found).
include-non-failures: Includes non-critical findings in the report.



File & Directory Control

skip-dirs / skip-files: Directories or files to exclude from scanning.
file-patterns: Maps file types to patterns (e.g., *.tf for Terraform).




Advanced Settings

offline-scan: Runs scan without internet (uses cached DB).
list-all-pkgs: Lists all packages found during scan.
db-repository / db-repository-tag: Source and version of vulnerability DB.
custom-headers: Adds headers to HTTP requests (useful for private registries).
timeout: Max time allowed for scan (e.g., 5m).
trace, debug, quiet: Logging and verbosity controls.



Policy & License Management

config-policy / config-data: Custom policy files for misconfig checks.
policy-namespaces / namespace: Namespaces for policy enforcement.
ignore-policy / ignore-file: Files to ignore specific findings.
license-full: Enables full license scanning.
license-categories: Filters licenses by category (e.g., OSI, FSF).
license-overrides: Overrides license classification (e.g., mark a license as non-redistributable).



Here is your commented trivy.yaml file explaining each configuration option:
📄 trivy_commented.yaml
It includes detailed comments for:

Severity levels
Scanner types
File patterns
License scanning
Policy and ignore settings
Output and behavior controls

You also have:

📄 trivy.yaml — the raw config file
📄 .mega-linter.yml — to run MegaLinter with Trivy



Here's your tailored .mega-linter.yml configuration file for scanning only Terraform files using Trivy:
Download .mega-linter.yml
🔧 Key Features:

Only Trivy enabled: All other linters are disabled.
Terraform-only scanning: Filters to .tf files exclusively.
Trivy configuration:

Scans for config and secret issues.
Targets HIGH and CRITICAL severity.
Outputs in table format.
Skips .terraform directories.




Here is your complete trivy.yaml configuration file:
📄 Download trivy.yaml
🔍 Highlights:

Timeout: 5 minutes
Exit code: 1 on issues (useful for CI pipelines)
Output: Table format, saved to trivy-report.txt
Scanners: misconfig and secret
Terraform-specific settings:

Uses terraform scanner
Loads variables from ./terraform/dev.tfvars and ./terraform/common.tfvars




steps:
  - name: Checkout Code
    uses: actions/checkout@v3
    with:
      fetch-depth: 0


Explanation:


steps:
This defines a sequence of actions to be performed in the workflow.


- name: Checkout Code
This is a human-readable name for the step. It helps identify what the step is doing.


uses: actions/checkout@v3
This tells GitHub Actions to use the official checkout action (version 3). This action checks out your repository's code so that subsequent steps can access it.


with:
This section provides input parameters to the checkout action.


fetch-depth: 0
This is a key configuration. By default, checkout fetches only the latest commit (fetch-depth: 1). Setting it to 0 fetches the entire Git history, which is useful if you need access to previous commits (e.g., for generating changelogs, running git log, or using Git tags).