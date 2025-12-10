terraform {
  required_version = "=1.9.8"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
     version = "4.55.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.7.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "2.8.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
}