resource "azurerm_app_service_plan" "test" {
  name                = "${var.application_type}-appsplan"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  #os_type             = "Linux"
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "test" {
  name                = "${var.application_type}-apps"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"
  app_service_plan_id = azurerm_app_service_plan.test.id

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = 0
  }
}