terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Pipeline_Resource_Group"
    storage_account_name = "pipelinestorageaccount12"
    container_name       = "statefile"
    key                  = "tfstate"
  }
  required_version = ">= 1.5.0"
}
provider "azurerm" {
  features {}
  subscription_id = "d10527a7-4555-428a-bb1f-74a7182b07b0"
}
