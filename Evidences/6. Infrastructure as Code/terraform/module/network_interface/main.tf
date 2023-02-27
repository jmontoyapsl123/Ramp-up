resource "azurerm_network_interface" "network-interface" {
  name                = var.network_name
  location            = var.location
  resource_group_name = var.resource-group-name
  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_ip
  }
  tags = {
    Responsable = "jmontoya-ramp-up"
    Proyecto    = "ramp-up"
    Creator     = "jmontoya"
  }
}