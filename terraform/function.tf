resource "azurerm_service_plan" "eensy_service_plan" {
  name                = "eensy-service-plan"
  resource_group_name = azurerm_resource_group.eensy_etl.name
  location            = azurerm_resource_group.eensy_etl.location
  os_type             = "Windows"
  sku_name            = "B1"
}

resource "azurerm_storage_account" "eensy_storage_acct" {
  name                     = "eensyetlstorageacct"
  resource_group_name      = azurerm_resource_group.eensy_etl.name
  location                 = azurerm_resource_group.eensy_etl.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_windows_function_app" "eensy_data_pull" {
  name = "eensy-etl-data-pull-app"
  resource_group_name = azurerm_resource_group.eensy_etl.name
  location = azurerm_resource_group.eensy_etl.location
  service_plan_id = azurerm_service_plan.eensy_service_plan.id
  storage_account_name = azurerm_storage_account.eensy_storage_acct.name
  # storage_key_vault_secret_id
  # storage_account_url = ""
  site_config {}
}
