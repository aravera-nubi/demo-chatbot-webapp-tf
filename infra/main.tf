# LOCALS

locals {
  tags = {
    CreatedBy = var.createdby
    Deadline  = var.deadline
    Owner     = var.owner
    Pod       = var.pod
    Project   = var.project
  }
}

# RESOURCES

resource "azurerm_resource_group" "resource_group" {
  name     = var.rg-name
  location = var.location
}