resource "azurerm_application_insights" "ai" {
  name                = local.app_insights_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  workspace_id        = local.platform_monitoring_workspace_id

  application_type    = "web"
  sampling_percentage = lookup(local.app_insights_sampling_percentage, var.environment, 25)

  disable_ip_masking = true
}
