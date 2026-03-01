output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}

output "web_app_name" {
  value = azurerm_linux_web_app.app.name
}

output "web_app_resource_group_name" {
  value = azurerm_linux_web_app.app.resource_group_name
}
