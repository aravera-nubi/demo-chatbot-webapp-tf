# LOCALS

locals {
  tags = {
    CreatedBy = var.createdby
    Deadline  = var.deadline
    Owner     = var.owner
    Pod       = var.pod
    Coe       = var.coe
    Project   = var.project
  }
}


# RESOURCES

# ------------------------------------------------------------------------------------------------------
# Resource Group
# ------------------------------------------------------------------------------------------------------

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.project}-${var.environment}-${var.location}"
  location = var.location
  tags = local.tags
}

# ------------------------------------------------------------------------------------------------------
# App service plan
# ------------------------------------------------------------------------------------------------------

resource "azurerm_service_plan" "service_plan" {
  name                = "asp-${var.project}-${var.environment}-${var.location}"
  location            =  azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = var.os_type
  sku_name            = var.sku_name
  tags = local.tags
}

# ------------------------------------------------------------------------------------------------------
# App service web app
# ------------------------------------------------------------------------------------------------------

resource "azurerm_linux_web_app" "web_app" {
  name                = "as-${var.project}-${var.environment}-${var.location}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.service_plan.location
  service_plan_id     = azurerm_service_plan.service_plan.id
  https_only          = true
  tags                = local.tags

  site_config {
    minimum_tls_version = "1.2"
    linux_fx_version = "PYTHON|3.11"
    always_on = true
  }
}
