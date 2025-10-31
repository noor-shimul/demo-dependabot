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


