resource "azurerm_resource_group" "eensy_etl" {
  name     = "eensy-etl"
  location = "eastus"
}

resource "azurerm_mssql_server" "eensy_db_server" {
  name = "eensy-db-server2"
  resource_group_name = azurerm_resource_group.eensy_etl.name
  location = azurerm_resource_group.eensy_etl.location
  version = "12.0"
  administrator_login = var.db_username
  administrator_login_password = var.db_password
}

resource "azurerm_mssql_database" "eensy_db" {
  name = "eensy-db"
  server_id = azurerm_mssql_server.eensy_db_server.id

  lifecycle {
    prevent_destroy = false
  }
}
