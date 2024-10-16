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
  subscription_id                 = "4cc66fde-f44e-4269-b92a-0169f8965674"
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "logbee" {
  name     = "logbee-resources"
  location = "West Europe"
}

resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = "logbee-cosmosdb"
  location            = azurerm_resource_group.logbee.location
  resource_group_name = azurerm_resource_group.logbee.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = azurerm_resource_group.logbee.location
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "example" {
  name                = "logbee-cosmosdb-sql-db"
  resource_group_name = azurerm_resource_group.logbee.name
  account_name        = azurerm_cosmosdb_account.cosmosdb.name

  autoscale_settings {
    max_throughput = 1000
  }
}
