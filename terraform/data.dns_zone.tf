data "azurerm_dns_zone" "primary" {
  provider = azurerm.dns

  name                = var.dns.domain
  resource_group_name = var.dns.resource_group_name
}
