# PROVIDERS
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.31.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.sub_id
}

# DB
resource "azurerm_resource_group" "eensy_db" {
  name     = "eensy-db"
  location = "eastus2"
}

resource "azurerm_mssql_server" "eensy_db_server" {
  name = "eensy-db-server"
  resource_group_name = azurerm_resource_group.eensy_db.name
  location = azurerm_resource_group.eensy_db.location
  version = "12.0"
  administrator_login = var.db_username
  administrator_login_password = var.db_password
}

# HOLD ON THIS - I don't know what this is for
# resource "azurerm_storage_account" "eensyStorage" {
#   name = "eensystorage"
#   resource_group_name = "Eensy"
#   location = "eastus"
#   account_tier = "Standard"
#   account_replication_type = "LRS"
# }

resource "azurerm_mssql_database" "eensy_db" {
  name = "eensy-db"
  server_id = azurerm_mssql_server.eensy_db_server.id

  lifecycle {
    prevent_destroy = true
  }
}