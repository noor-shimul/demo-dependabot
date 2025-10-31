
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





------------------------
2025-10-31T23:07:31Z	INFO	Loaded	file_path="trivy.yaml"
Scan local filesystem

Usage:
  trivy filesystem [flags] PATH

Aliases:
  filesystem, fs

Examples:
  # Scan a local project including language-specific files
  $ trivy fs /path/to/your_project

  # Scan a single file
  $ trivy fs ./trivy-ci-test/Pipfile.lock

Cache Flags
      --cache-backend string   [EXPERIMENTAL] cache backend (e.g. redis://localhost:6379) (default "memory")
      --cache-ttl duration     cache TTL when using redis as cache backend
      --redis-ca string        redis ca file location, if using redis as cache backend
      --redis-cert string      redis certificate file location, if using redis as cache backend
      --redis-key string       redis key file location, if using redis as cache backend
      --redis-tls              enable redis TLS with public certificates, if using redis as cache backend

DB Flags
      --db-repository strings        OCI repository(ies) to retrieve trivy-db in order of priority (default [mirror.gcr.io/aquasec/trivy-db:2,ghcr.io/aquasecurity/trivy-db:2])
      --download-db-only             download/update vulnerability database but don't run a scan
      --download-java-db-only        download/update Java index database but don't run a scan
      --java-db-repository strings   OCI repository(ies) to retrieve trivy-java-db in order of priority (default [mirror.gcr.io/aquasec/trivy-java-db:1,ghcr.io/aquasecurity/trivy-java-db:1])
      --no-progress                  suppress progress bar
      --skip-db-update               skip updating vulnerability database
      --skip-java-db-update          skip updating Java index database

License Flags
      --ignored-licenses strings         specify a list of license to ignore
      --license-confidence-level float   specify license classifier's confidence level (default 0.9)
      --license-full                     eagerly look for licenses in source code headers and license files

Misconfiguration Flags
      --cf-params strings                 specify paths to override the CloudFormation parameters files
      --checks-bundle-repository string   OCI registry URL to retrieve checks bundle from (default "mirror.gcr.io/aquasec/trivy-checks:1")
      --config-file-schemas strings       specify paths to JSON configuration file schemas to determine that a file matches some configuration and pass the schema to Rego checks for type checking
      --helm-api-versions strings         Available API versions used for Capabilities.APIVersions. This flag is the same as the api-versions flag of the helm template command. (can specify multiple or separate values with commas: policy/v1/PodDisruptionBudget,apps/v1/Deployment)
      --helm-kube-version string          Kubernetes version used for Capabilities.KubeVersion. This flag is the same as the kube-version flag of the helm template command.
      --helm-set strings                  specify Helm values on the command line (can specify multiple or separate values with commas: key1=val1,key2=val2)
      --helm-set-file strings             specify Helm values from respective files specified via the command line (can specify multiple or separate values with commas: key1=path1,key2=path2)
      --helm-set-string strings           specify Helm string values on the command line (can specify multiple or separate values with commas: key1=val1,key2=val2)
      --helm-values strings               specify paths to override the Helm values.yaml files
      --include-non-failures              include successes, available with '--scanners misconfig'
      --misconfig-scanners strings        comma-separated list of misconfig scanners to use for misconfiguration scanning (default [azure-arm,cloudformation,dockerfile,helm,kubernetes,terraform,terraformplan-json,terraformplan-snapshot])
      --raw-config-scanners strings       specify the types of scanners that will also scan raw configurations. For example, scanners will scan a non-adapted configuration into a shared state (allowed values: terraform)
      --render-cause strings              specify configuration types for which the rendered causes will be shown in the table report (allowed values: terraform)
      --tf-exclude-downloaded-modules     exclude misconfigurations for downloaded terraform modules
      --tf-vars strings                   specify paths to override the Terraform tfvars files

Module Flags
      --enable-modules strings   [EXPERIMENTAL] module names to enable
      --module-dir string        specify directory to the wasm modules that will be loaded (default "/github/home/.trivy/modules")

Package Flags
      --include-dev-deps            include development dependencies in the report (supported: npm, yarn, gradle)
      --pkg-relationships strings   list of package relationships
                                    Allowed values:
                                      - unknown
                                      - root
                                      - workspace
                                      - direct
                                      - indirect
                                     (default [unknown,root,workspace,direct,indirect])
      --pkg-types strings           list of package types (allowed values: os,library) (default [os,library])

Client/Server Flags
      --custom-headers strings   custom headers in client mode
      --server string            server address in client mode
      --token string             for authentication in client/server mode
      --token-header string      specify a header name for token in client/server mode (default "Trivy-Token")

Registry Flags
      --password strings        password. Comma-separated passwords allowed. TRIVY_PASSWORD should be used for security reasons.
      --password-stdin          password from stdin. Comma-separated passwords are not supported.
      --registry-token string   registry token
      --username strings        username. Comma-separated usernames allowed.

Rego Flags
      --check-namespaces strings    Rego namespaces
      --config-check strings        specify the paths to the Rego check files or to the directories containing them, applying config files
      --config-data strings         specify paths from which data for the Rego checks will be recursively loaded
      --include-deprecated-checks   include deprecated checks
      --skip-check-update           skip fetching rego check updates
      --trace-rego                  enable more verbose trace output for custom queries

Report Flags
      --compliance string          compliance report to generate
      --dependency-tree            [EXPERIMENTAL] show dependency origin tree of vulnerable packages
      --exit-code int              specify exit code when any security issues are found
  -f, --format string              format
                                   Allowed values:
                                     - table
                                     - json
                                     - template
                                     - sarif
                                     - cyclonedx
                                     - spdx
                                     - spdx-json
                                     - github
                                     - cosign-vuln
                                    (default "table")
      --ignore-policy string       specify the Rego file path to evaluate each vulnerability
      --ignorefile string          specify .trivyignore file (default ".trivyignore")
      --list-all-pkgs              output all packages in the JSON report regardless of vulnerability (default true)
  -o, --output string              output file name
      --output-plugin-arg string   [EXPERIMENTAL] output plugin arguments
      --report string              specify a compliance report format for the output (allowed values: all,summary) (default "all")
  -s, --severity strings           severities of security issues to be displayed
                                   Allowed values:
                                     - UNKNOWN
                                     - LOW
                                     - MEDIUM
                                     - HIGH
                                     - CRITICAL
                                    (default [UNKNOWN,LOW,MEDIUM,HIGH,CRITICAL])
      --show-suppressed            [EXPERIMENTAL] show suppressed vulnerabilities
      --table-mode strings         [EXPERIMENTAL] tables that will be displayed in 'table' format (allowed values: summary,detailed) (default [summary,detailed])
  -t, --template string            output template

Scan Flags
      --detection-priority string   specify the detection priority:
                                      - "precise": Prioritizes precise by minimizing false positives.
                                      - "comprehensive": Aims to detect more security findings at the cost of potential false positives.
                                     (allowed values: precise,comprehensive) (default "precise")
      --disable-telemetry           disable sending anonymous usage data to Aqua
      --distro string               [EXPERIMENTAL] specify a distribution, <family>/<version>
      --file-patterns strings       specify config file patterns
      --offline-scan                do not issue API requests to identify dependencies
      --parallel int                number of goroutines enabled for parallel scanning, set 0 to auto-detect parallelism (default 5)
      --rekor-url string            [EXPERIMENTAL] address of rekor STL server (default "https://rekor.sigstore.dev")
      --sbom-sources strings        [EXPERIMENTAL] try to retrieve SBOM from the specified sources (allowed values: oci,rekor)
      --scanners strings            comma-separated list of what security issues to detect (allowed values: vuln,misconfig,secret,license) (default [vuln,secret])
      --skip-dirs strings           specify the directories or glob patterns to skip
      --skip-files strings          specify the files or glob patterns to skip
      --skip-version-check          suppress notices about version updates and Trivy announcements

Secret Flags
      --secret-config string   specify a path to config file for secret scanning (default "trivy-secret.yaml")

Vulnerability Flags
      --ignore-status strings          comma-separated list of vulnerability status to ignore
                                       Allowed values:
                                         - unknown
                                         - not_affected
                                         - affected
                                         - fixed
                                         - under_investigation
                                         - will_not_fix
                                         - fix_deferred
                                         - end_of_life
      --ignore-unfixed                 display only fixed vulnerabilities
      --skip-vex-repo-update           [EXPERIMENTAL] Skip VEX Repository update
      --vex strings                    [EXPERIMENTAL] VEX sources ("repo", "oci" or file path)
      --vuln-severity-source strings   order of data sources for selecting vulnerability severity level
                                       Allowed values:
                                         - nvd
                                         - redhat
                                         - redhat-oval
                                         - debian
                                         - ubuntu
                                         - alpine
                                         - amazon
                                         - oracle-oval
                                         - suse-cvrf
                                         - photon
                                         - arch-linux
                                         - alma
                                         - rocky
                                         - cbl-mariner
                                         - azure
                                         - ruby-advisory-db
                                         - php-security-advisories
                                         - nodejs-security-wg
                                         - ghsa
                                         - glad
                                         - aqua
                                         - osv
                                         - k8s
                                         - wolfi
                                         - chainguard
                                         - bitnami
                                         - govulndb
                                         - echo
                                         - minimos
                                         - rootio
                                         - auto
                                        (default [auto])

Global Flags:
      --cache-dir string          cache directory (default "/github/home/.cache/trivy")
  -c, --config string             config path (default "trivy.yaml")
  -d, --debug                     debug mode
      --generate-default-config   write the default config to trivy-default.yaml
      --insecure                  allow insecure server connections
  -q, --quiet                     suppress progress bar and log output
      --timeout duration          timeout (default 5m0s)
  -v, --version                   show version
2025-10-31T23:07:31Z	FATAL	Fatal error	multiple targets cannot be specified

--------------------------------------