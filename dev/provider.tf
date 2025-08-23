terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.39.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "first-rg"
    storage_account_name = "firststg"
    container_name = "bhawani-container"
    key = "first.tfstate"

  }
}

provider "azurerm" {
  features {}
  subscription_id = "177b7e12-5f03-4f63-bcd1-ed6d1d776bff"
}