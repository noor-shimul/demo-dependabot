
# Trivy configuration file for scanning vulnerabilities, misconfigurations, secrets, and licenses

# Define the severity levels to report (options: UNKNOWN, LOW, MEDIUM, HIGH, CRITICAL)
severity: [UNKNOWN, LOW, MEDIUM, HIGH, CRITICAL]

# Specify the types of scanners to use
# - vuln: scan for OS and library vulnerabilities
# - misconfig: scan for misconfigurations in IaC files
# - secret: detect hardcoded secrets
# - license: detect license issues in dependencies
scanners:
  - vuln
  - misconfig
  - secret
  - license

# Specify the types of vulnerabilities to scan for
# - os: operating system packages
# - library: application dependencies
vuln-type:
  - os
  - library

# Ignore vulnerabilities that do not have a fix yet
ignore-unfixed: true

# Output format of the scan results (options: table, json, sarif, etc.)
format: table

# Exit code to return when vulnerabilities/misconfigurations are found
# 0 = success, 1 = failure
exit-code: 1

# Include non-failure results in the output (e.g., INFO, LOW severity)
include-non-failures: true

# Skip scanning these directories
skip-dirs:
  - .git
  - node_modules
  - vendor

# Skip scanning these specific files
skip-files:
  - README.md

# Define file patterns for specific types of files to scan
file-patterns:
  terraform: ['*.tf']
  yaml: ['*.yaml', '*.yml']
  json: ['*.json']

# Run scan in offline mode using local cache
offline-scan: false

# List all packages found during the scan
list-all-pkgs: true

# Specify custom database repository and tag (optional)
db-repository: ghcr.io/aquasecurity/trivy-db
db-repository-tag: latest

# Add custom HTTP headers for accessing private registries (optional)
custom-headers:
  X-API-Key: your-api-key-here

# Set timeout for the scan (e.g., 5m = 5 minutes)
timeout: 5m

# Enable trace output for debugging
trace: false

# Enable debug output
debug: false

# Suppress all output except for errors
quiet: false

# Specify custom policy directory for misconfiguration scanning (optional)
config-policy: ./policies

# Specify custom data directory for policy evaluation (optional)
config-data: ./policy-data

# Define policy namespaces to use (optional)
policy-namespaces:
  - custom

# Set the default namespace for policy evaluation (optional)
namespace: custom

# Specify a file to ignore specific policy violations (optional)
ignore-policy: .trivyignore

# Specify a file to ignore specific vulnerabilities or misconfigurations
ignore-file: .trivyignore

# Enable full license scanning
license-full: true

# Define license categories to include in the scan
license-categories:
  - FSF
  - OSI

# Override license classification (e.g., mark a license as non-redistributable)
license-overrides:
  GPL-3.0-only: non-redistributable
