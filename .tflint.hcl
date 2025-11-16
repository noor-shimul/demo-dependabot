
# config {
#   deep_check = true
#   ignore_module = false
# }





# If you want to customize TFLint behavior, add a .tflint.hcl file:
# config {
#   deep_check = false #true
#   ignore_module = false
# }


/*
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

*/

/*
🔧 What You Can Customize

Enable/Disable Rules: Use rule "<rule_name>" { enabled = true|false }
Plugin Configuration: Specify provider-specific plugins like AWS, Azure, GCP
Ignore Modules: Skip linting for specific modules
Variable Injection: Pass variables for evaluation
Output Format: Choose between default, json, compact, sarif, etc.
Module Call Type: Control whether local or remote modules are analyzed

Example: AWS Plugin with Custom Rules


plugin "aws" {
  enabled = true
  version = "0.43.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "aws_instance_invalid_type" {
  enabled = true
}

rule "aws_s3_bucket_public_access_block" {
  enabled = true
}

Updated .tflint.hcl with AWS and Azure Rules

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

*/

