terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
   features {}
   

#    subscription_id = var.subscription_id
#    tenant_id       = var.tenant_id
#    client_id       = var.client_id
#    client_secret   = var.client_secret
}

resource "azurerm_resource_group" "backend" {
  name     = "tfstate-rg12"
  location = "East US"
}

resource "azurerm_storage_account" "backend" {
  name                     = "tfstatebackend8750"
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
 
resource "azurerm_storage_container" "backend" {
  name                 = "tfstate12"
  storage_account_name = azurerm_storage_account.backend.name
}