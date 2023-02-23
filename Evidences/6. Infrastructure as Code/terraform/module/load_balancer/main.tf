resource "azurerm_public_ip" "public-ip-lb" {
  name                = "public-ip-lb"
  location            = var.location
  resource_group_name = var.resource_name
  allocation_method   = "Static"
}

resource "azurerm_lb_rule" "lb-rule" {
  loadbalancer_id                = azurerm_lb.front-lb.id
  name                           = "rule-lb"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 8080
  frontend_ip_configuration_name = "public-ip-lb"
}

resource "azurerm_lb_probe" "probe-lb" {
  loadbalancer_id     = azurerm_lb.front-lb.id
  name                = "running-probe"
  port                = 8080
}

resource "azurerm_lb" "front-lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_name

  frontend_ip_configuration {
    name                 = "public-ip"
    public_ip_address_id = azurerm_public_ip.public-ip-lb.id
  }
}



