resource "azurerm_lb_probe" "probe-lb" {
  resource_group_name = var.resource-group-name
  loadbalancer_id     = var.load-balancer-id
  name                = var.probe-name-lb
  protocol            = "TCP"
  port                = var.probe-port-lb
  interval_in_seconds = 5
  number_of_probes    = 2
}