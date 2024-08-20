terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.96.0" #version para app service con runtime python 3.10
    }
  }
}

provider "azurerm" {
  features {}
} 