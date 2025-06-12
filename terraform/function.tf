resource "azurerm_eventgrid_topic" "eensy_event_topic" {

}

module "functions" {

}

resource "azurerm_eventgrid_event_subscription" "eensy_event_subscription" {

}

resource "azurerm_function_app_function" "eensy_fun_app" {

}

resource "azurerm_function_app_function" "eensy_app" {
  name            = "eensy-app"
  function_app_id = azurerm_linux_function_app.example.id
  language        = "Java"
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"
      },
    ]
  })
}