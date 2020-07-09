data "azurerm_resource_group" "rg" {
  name = var.resource-group-name
}

locals {
  baseName = "${var.appName}-${var.environment}-appinsights"
}

resource "azurerm_application_insights" "appInsights" {
  name                = local.baseName
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tags                = data.azurerm_resource_group.rg.tags
  application_type    = var.application_type
}
