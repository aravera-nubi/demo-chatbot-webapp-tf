# Create  a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = var.rg-name
  location = var.location
}