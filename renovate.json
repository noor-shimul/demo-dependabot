{
  "$schema": "https://docs.renovatebot.com/renovate-schema.json",
  "extends": ["config:recommended"],
  "enabledManagers": ["terraform"],
  "dependencyDashboard": true,
  "packageRules": [
    {
      "matchManagers": ["terraform"],
      "matchDepNames": ["azurerm", "azuread"],
      "groupName": "Azure Terraform Providers",
      "groupSlug": "azure-providers",
      "matchDatasources": ["terraform-provider"],
      "matchFilePatterns": ["**/*.tf"]
    },
    {
      "matchManagers": ["terraform"],
      "matchDatasources": ["terraform-provider", "terraform-module"],
      "additionalBranchPrefix": "{{baseDir}}-",
      "matchFilePatterns": ["**/terraform/**"]
    }
  ],
  "terraform": {
    "enabled": true,
    "fileMatch": ["**/*.tf"]
  }
}

