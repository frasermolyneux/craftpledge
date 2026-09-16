resource "azurerm_service_plan" "app" {
  count = var.environment == "dev" ? 1 : 0

  name                = local.service_plan_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "B1"
  tags                = var.tags
}
