resource "azurerm_network_security_group" "security_group" {
  name                = var.sg_name
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                   = var.sg_name
    priority               = var.priority
    direction              = var.direction
    access                 = var.access
    protocol               = var.protocol
    destination_port_range = var.destination_port_range
    source_port_range      = var.source_port_range
  }

  tags = var.tags

}

