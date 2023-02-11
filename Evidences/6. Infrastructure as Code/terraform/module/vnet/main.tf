resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vn_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnet_address_prefix

  name                 = each.value.name
  address_prefix       = each.value.address
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  resource_group_name  = var.resource_group_name
}