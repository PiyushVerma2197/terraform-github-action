terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
  
  backend "azurerm" {}
}

provider "azurerm" {
  features {}

  use_oidc = true
  subscription_id = var.subscription_id  
}
