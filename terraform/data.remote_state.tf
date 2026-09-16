data "terraform_remote_state" "platform_hosting" {
  for_each = var.environment == "prd" ? { prd = var.platform_hosting_state } : {}

  backend = "azurerm"

  config = {
    resource_group_name  = each.value.resource_group_name
    storage_account_name = each.value.storage_account_name
    container_name       = each.value.container_name
    key                  = each.value.key
    use_oidc             = each.value.use_oidc
    subscription_id      = each.value.subscription_id
    tenant_id            = each.value.tenant_id
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
