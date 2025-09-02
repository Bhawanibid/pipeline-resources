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
  subscription_id = "ff9732b6-644f-42fb-aad3-79fa3d280afd"
}
