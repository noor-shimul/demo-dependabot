terraform {
  required_version = "=1.9.8"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
     version = "4.53.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.6.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "2.7.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}
