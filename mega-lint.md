---------------------
# .mega-linter.yml and it's config
# Configuration file for MegaLinter
# See all available variables at https://megalinter.io/latest/config-file/ and in linters documentation
APPLY_FIXES: none
ENABLE_LINTERS:
  # GitHub Actions
  - ACTION_ACTIONLINT

  # JSON
  - JSON_PRETTIER

  # Markdown
  - MARKDOWN_MARKDOWNLINT

  # Repository
  - REPOSITORY_TRIVY
  - REPOSITORY_GITLEAKS

  # Terraform
  - TERRAFORM_TERRAFORM_FMT
  - TERRAFORM_TFLINT

  # YAML
  - YAML_PRETTIER

SARIF_REPORTER: true
DISABLE_ERRORS: false
MARKDOWN_MARKDOWN_LINK_CHECK_DISABLE_ERRORS: true
SHOW_ELAPSED_TIME: true
FILEIO_REPORTER: false
PARALLEL: true
GITHUB_STATUS_REPORTER: true
GITHUB_COMMENT_REPORTER: true
VALIDATE_ALL_CODEBASE: false
LOG_LEVEL: INFO
TERRAFORM_TFLINT_UNSECURED_ENV_VARIABLES: [GITHUB_TOKEN]


-------------------------------------------------------------------------------
.github/workflows/mega-linter.yml - code below

name: ♻️ MegaLinter

on:
  pull_request:
    branches: [main]

permissions: {}

jobs:
  megalinter:
    name: MegaLinter
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
      security-events: write
    steps:
      - name: Checkout Code
        uses: actions/checkout@08c6903cd8c0fde910a37f88322edcfb5dd907a8 # v5.0.0
        with:
          fetch-depth: 0

      - name: MegaLinter
        uses: oxsecurity/megalinter@0dcbedd66ea456ba2d54fd350affaa15df8a0da3 # v9.0.1
        env:
          VALIDATE_ALL_CODEBASE: ${{ github.event_name == 'push' && github.ref == 'refs/heads/main' }} # Validates all source when push on main, else just the git diff with main. Override with true if you always want to lint all sources
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      - name: Archive production artifacts
        if: success() || failure()
        uses: actions/upload-artifact@ea165f8d65b6e75b540449e92b4886f43607fa02 # v4.6.2
        with:
          name: MegaLinter reports
          path: |
            megalinter-reports
            mega-linter.log

      - name: Upload MegaLinter scan results to GitHub Security tab
        if: success() || failure()
        uses: github/codeql-action/upload-sarif@cf7e9f23492505046de9a37830c3711dd0f25bb3 # v2.16.2
        with:
          sarif_file: "megalinter-reports/megalinter-report.sarif"



---------------------
---
# Configuration file for MegaLinter
# See all available variables at https://megalinter.io/latest/config-file/ and in linters documentation
APPLY_FIXES: none
DISABLE_ERRORS: false
ENABLE_LINTERS:
  # GitHub Actions
  - ACTION_ACTIONLINT

  # JSON
  - JSON_PRETTIER

  # Markdown
  - MARKDOWN_MARKDOWNLINT

  # Repository
  - REPOSITORY_TRIVY
  - REPOSITORY_GITLEAKS

  # Terraform
  - TERRAFORM_TERRAFORM_FMT
  - TERRAFORM_TFLINT

  # YAML
  - YAML_PRETTIER

FILEIO_REPORTER: false
GITHUB_STATUS_REPORTER: true
GITHUB_COMMENT_REPORTER: true
LOG_LEVEL: INFO
MARKDOWN_MARKDOWN_LINK_CHECK_DISABLE_ERRORS: true
PARALLEL: true
SARIF_REPORTER: true
SHOW_ELAPSED_TIME: true
TERRAFORM_TFLINT_UNSECURED_ENV_VARIABLES: [GITHUB_TOKEN]
VALIDATE_ALL_CODEBASE: false

-----------------------------------------------------------------
name: ♻️ MegaLinter

on:
  pull_request:
    branches: [main]

jobs:
  megalinter:
    name: MegaLinter
    runs-on: ubuntu-latest
    permissions:
      contents: read
      actions: read
      pull-requests: write
      security-events: write
    steps:
      - name: Checkout Code
        uses: actions/checkout@08c6903cd8c0fde910a37f88322edcfb5dd907a8 # v5.0.0
        with:
          fetch-depth: 0

      - name: MegaLinter
        uses: oxsecurity/megalinter@62c799d895af9bcbca5eacfebca29d527f125a57 # v9.1.0
        env:
          VALIDATE_ALL_CODEBASE: ${{ github.event_name == 'push' && github.ref == 'refs/heads/main' }} # Validates all source when push on main, else just the git diff with main. Override with true if you always want to lint all sources
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      - name: Archive production artifacts
        if: success() || failure()
        uses: actions/upload-artifact@330a01c490aca151604b8cf639adc76d48f6c5d4 # v5.0.0
        with:
          name: MegaLinter reports
          path: |
            megalinter-reports
            mega-linter.log

      - name: Upload MegaLinter scan results to GitHub Security tab
        if: success() || failure()
        uses: github/codeql-action/upload-sarif@cf7e9f23492505046de9a37830c3711dd0f25bb3 # v2.16.2
        with:
          sarif_file: "megalinter-reports/megalinter-report.sarif"