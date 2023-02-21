resource "azurerm_lb_probe" "probe-lb" {
  loadbalancer_id     = var.load-balancer-id
  name                = var.probe-name-lb
  protocol            = "Tcp"
  port                = var.probe-port-lb
  interval_in_seconds = 5
  number_of_probes    = 2
}