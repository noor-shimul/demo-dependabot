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




--------------------------------
.mega-linter.yml

# Configuration file for MegaLinter
# See all available variables at https://megalinter.io/configuration/ and in linters documentation

APPLY_FIXES: all
# ENABLE: # If you use ENABLE variable, all other languages/formats/tooling formats will be disabled by default
# ENABLE_LINTERS: # If you use ENABLE_LINTERS variable, all other linters will be disabled by default
DISABLE:
  - CLOUDFORMATION
  # - COPYPASTE # Uncomment to disable checks of excessive copy-pastes
  - CSS
  - EDITORCONFIG
  # - SPELL # Uncomment to disable checks of spelling mistakes
  - JAVASCRIPT
  - TEKTON
DISABLE_LINTERS:
  - JSON_PRETTIER
  - PYTHON_PYRIGHT
  - REPOSITORY_GITLEAKS
  - REPOSITORY_KICS
  - SPELL_PROSELINT
  - SPELL_MISSPELL
  - SPELL_VALE
DISABLE_ERRORS_LINTERS:
  - PYTHON_BANDIT
  - REPOSITORY_DEVSKIM
  - REPOSITORY_GRYPE
  - REPOSITORY_SEMGREP
  - SPELL_LYCHEE
  - YAML_YAMLLINT
PRINT_ALL_FILES: false
FILTER_REGEX_EXCLUDE: '(\.automation/test|\.automation/generated|\.venv|\.github/workflows|docs/javascripts|docs/overrides|docs/json-schemas|flavors|clj-kondo|TEMPLATES)'
JSON_JSONLINT_FILTER_REGEX_EXCLUDE: '(\.vscode/)'
YAML_YAMLLINT_FILTER_REGEX_EXCLUDE: '(templates/\.mega-linter\.yml)'
YAML_PRETTIER_FILTER_REGEX_EXCLUDE: '(templates/\.mega-linter\.yml|mkdocs\.yml)'
YAML_V8R_FILTER_REGEX_EXCLUDE: '(descriptors|templates/\.mega-linter\.yml|\.codecov\.yml)'
BASH_FILTER_REGEX_EXCLUDE: "(lib)"
MARKDOWN_FILTER_REGEX_EXCLUDE: '(license\.md|docs/licenses)'
SPELL_VALE_FILE_EXTENSIONS:
  - .md
SPELL_FILTER_REGEX_EXCLUDE: (valestyles|\.github|docs/licenses)
DOCKERFILE_HADOLINT_ARGUMENTS: "--ignore DL3003 --ignore DL3007 --ignore DL3013 --ignore DL3016 --ignore DL3018 --ignore DL3028 --ignore DL3059 --ignore DL4001 --ignore DL4006 --ignore SC2015 --ignore SC2016 --ignore SC2039 --ignore SC2086 --ignore SC1091 --ignore SC3046"
REPOSITORY_TRIVY_ARGUMENTS:
  - "--skip-dirs"
  - ".automation/test"
  - "--skip-dirs"
  - ".venv"
REPOSITORY_TRUFFLEHOG_ARGUMENTS:
  - --exclude-paths=.trufflehogignore
REPORTERS_MARKDOWN_SUMMARY_TYPE: sections
SHOW_ELAPSED_TIME: true
FLAVOR_SUGGESTIONS: false
EMAIL_REPORTER: false
FILEIO_REPORTER: false
JSON_REPORTER: true
GITHUB_STATUS_REPORTER: false
PLUGINS:
  - https://raw.githubusercontent.com/oxsecurity/megalinter/main/.automation/test/mega-linter-plugin-test/test.megalinter-descriptor.yml
PRE_COMMANDS:
  - command: echo "This is MegaLinter PRE_COMMAND on own MegaLinter ! :)"
    cwd: "root"
POST_COMMANDS:
  - command: echo "This is MegaLinter POST_COMMAND on own MegaLinter ! :)"
    cwd: "workspace"