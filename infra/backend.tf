terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-github-demo"
    storage_account_name = "sawebappterraformstate"
    container_name       = "tfstatefile"
    key                  = "stateActions.tfstate"
  }
}