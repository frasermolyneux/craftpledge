locals {
  resource_group_name              = "rg-${var.workload}-${var.environment}-${var.location}"
  service_plan_name                = "asp-${var.workload}-${var.environment}-${var.location}-default"
  platform_monitoring_workspace_id = data.terraform_remote_state.platform_monitoring.outputs.log_analytics.id
  web_app_name                     = "app-${var.workload}-${var.environment}-${var.location}-${random_id.environment_id.hex}"
  app_insights_name                = "ai-${var.workload}-${var.environment}-${var.location}"
  public_hostname                  = "${var.dns.subdomain}.${var.dns.domain}"

  app_service_plan = var.environment == "dev" ? {
    id                  = azurerm_service_plan.app[0].id
    location            = azurerm_service_plan.app[0].location
    resource_group_name = azurerm_service_plan.app[0].resource_group_name
    } : {
    id                  = data.terraform_remote_state.platform_hosting["prd"].outputs.app_service_plans["default"].id
    location            = data.terraform_remote_state.platform_hosting["prd"].outputs.app_service_plans["default"].location
    resource_group_name = data.terraform_remote_state.platform_hosting["prd"].outputs.app_service_plans["default"].resource_group_name
  }

  app_insights_sampling_percentage = {
    dev = 25
    prd = 75
  }
}
