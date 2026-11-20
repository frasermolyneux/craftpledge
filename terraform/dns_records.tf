removed {
  from = azurerm_dns_txt_record.app_service_verification

  lifecycle {
    destroy = false
  }
}

removed {
  from = azurerm_dns_cname_record.web_app

  lifecycle {
    destroy = false
  }
}

data "cloudflare_dns_records" "legacy_web_app" {
  count = var.environment == "prd" ? 1 : 0

  zone_id = var.dns.zone_id
  name = {
    exact = local.public_hostname
  }
  type = "CNAME"
}

import {
  for_each = var.environment == "prd" ? toset([
    for record in data.cloudflare_dns_records.legacy_web_app[0].result : record.id
    if record.id == "7beeb63b30023a3f1a19d18080328e82"
  ]) : toset([])
  to = cloudflare_dns_record.web_app
  id = "${var.dns.zone_id}/${each.value}"
}

resource "cloudflare_dns_record" "app_service_verification" {
  zone_id = var.dns.zone_id
  name    = "asuid.${local.public_hostname}"
  type    = "TXT"
  ttl     = 300
  content = azurerm_linux_web_app.app.custom_domain_verification_id
}

resource "cloudflare_dns_record" "web_app" {
  zone_id = var.dns.zone_id
  name    = local.public_hostname
  type    = "CNAME"
  ttl     = var.environment == "prd" ? 1 : 300
  content = "${azurerm_linux_web_app.app.name}.azurewebsites.net"
  proxied = var.environment == "prd"

  depends_on = [
    cloudflare_dns_record.app_service_verification
  ]
}
