resource "azurerm_resource_group" "rg-test" {
  name     = var.rg_name
  location = var.location
}