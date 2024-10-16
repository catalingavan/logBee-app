terraform {
  required_providers {
    azurerm = {
      version = "~> 4.5"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                 = local.subscription_id
  resource_provider_registrations = "none"
}

data "terraform_remote_state" "common" {
  backend = "local"
  config = {
    path = "../01_common/terraform.tfstate"
  }
}

resource "azurerm_storage_account" "logbee_storage_account" {
  name                     = "logbeestorage" # Must be globally unique
  location                 = data.terraform_remote_state.common.outputs.resource_group_location
  resource_group_name      = data.terraform_remote_state.common.outputs.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "logbee_storage_container" {
  name                  = "logbee-container"
  storage_account_name  = azurerm_storage_account.logbee_storage_account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "frontend_appsettings" {
  name                   = "frontend.appsettings.json"
  storage_account_name   = azurerm_storage_account.logbee_storage_account.name
  storage_container_name = azurerm_storage_container.logbee_storage_container.name
  type                   = "Block"
  source                 = "frontend.appsettings.json"
}
