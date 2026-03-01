data "terraform_remote_state" "platform_hosting" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.platform_hosting_state.resource_group_name
    storage_account_name = var.platform_hosting_state.storage_account_name
    container_name       = var.platform_hosting_state.container_name
    key                  = var.platform_hosting_state.key
    use_oidc             = var.platform_hosting_state.use_oidc
    subscription_id      = var.platform_hosting_state.subscription_id
    tenant_id            = var.platform_hosting_state.tenant_id
  }
}

data "terraform_remote_state" "platform_monitoring" {
  backend = "azurerm"

  config = {
    resource_group_name  = var.platform_monitoring_state.resource_group_name
    storage_account_name = var.platform_monitoring_state.storage_account_name
    container_name       = var.platform_monitoring_state.container_name
    key                  = var.platform_monitoring_state.key
    use_oidc             = true
    subscription_id      = var.platform_monitoring_state.subscription_id
    tenant_id            = var.platform_monitoring_state.tenant_id
  }
}
