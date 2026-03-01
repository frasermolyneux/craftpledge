resource "azurerm_dns_txt_record" "app_service_verification" {
  provider = azurerm.dns

  name                = "asuid.${var.dns.subdomain}"
  zone_name           = data.azurerm_dns_zone.primary.name
  resource_group_name = data.azurerm_dns_zone.primary.resource_group_name
  ttl                 = 300

  record {
    value = azurerm_linux_web_app.app.custom_domain_verification_id
  }
}

resource "azurerm_dns_cname_record" "web_app" {
  provider = azurerm.dns

  name                = var.dns.subdomain
  zone_name           = data.azurerm_dns_zone.primary.name
  resource_group_name = data.azurerm_dns_zone.primary.resource_group_name
  ttl                 = 300
  record              = "${azurerm_linux_web_app.app.name}.azurewebsites.net"

  depends_on = [
    azurerm_dns_txt_record.app_service_verification
  ]
}
