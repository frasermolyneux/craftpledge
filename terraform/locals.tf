locals {
  resource_group_name               = "rg-${var.workload}-${var.environment}-${var.location}"
  platform_hosting_app_service_plan = data.terraform_remote_state.platform_hosting.outputs.app_service_plans["default"]
  platform_monitoring_workspace_id  = data.terraform_remote_state.platform_monitoring.outputs.log_analytics.id
  web_app_name                      = "app-${var.workload}-${var.environment}-${var.location}-${random_id.environment_id.hex}"
  app_insights_name                 = "ai-${var.workload}-${var.environment}-${var.location}"
  public_hostname                   = "${var.dns.subdomain}.${var.dns.domain}"

  app_insights_sampling_percentage = {
    dev = 25
    prd = 75
  }
}
