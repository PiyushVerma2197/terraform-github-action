terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
  
  backend "azurerm" {
    resource_group_name  = "tfstate-rg12"
    storage_account_name = "tfstatebackend8750"
    container_name       = "tfstate12"
    key                 = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  use_oidc = true
  subscription_id = var.subscription_id  
  client_id       = var.client_id
  #client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
