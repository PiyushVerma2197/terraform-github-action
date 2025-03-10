# 



terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
}

provider "azurerm" {
  features {}

  use_oidc = true

  # This will force Terraform to pick the subscription from OIDC token
  skip_provider_registration = true
}
