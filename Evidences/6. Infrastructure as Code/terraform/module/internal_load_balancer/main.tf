resource "azurerm_lb" "internal-lb" {
  name                = var.internal-name-lb
  resource_group_name = var.resource-group-name
  location            = var.location
  sku                 = "Standard"
  frontend_ip_configuration {
    name                          = "LoadBalancerFrontEnd"
    subnet_id                     = var.subnet_id
    private_ip_address            = var.ip_address_lb
    private_ip_address_allocation = "Static"
  }
}
 