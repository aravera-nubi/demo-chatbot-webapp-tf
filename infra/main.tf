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
  name                = "as-${var.service_name}-${var.project}-${var.environment}-${var.location}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.service_plan.location
  service_plan_id     = azurerm_service_plan.service_plan.id
  https_only          = true
  tags                = local.tags

  site_config {
    always_on         = var.always_on
    use_32_bit_worker = var.use_32_bit_worker
    app_command_line  = var.app_command_line
    application_stack {
      python_version = var.python_version
    }
  }

  app_settings = var.app_settings

}

