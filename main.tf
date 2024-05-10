terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {
    organization = "syed-tfc-org"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true

}

resource "azurerm_resource_group" "rg" {
  name     = "813-e3526dd7-hands-on-with-terraform-on-azure"
  location = "eastus"

}

module "securestorage" {
  source               = "app.terraform.io/syed-tfc-org/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "mystorageaccnt15332"
}