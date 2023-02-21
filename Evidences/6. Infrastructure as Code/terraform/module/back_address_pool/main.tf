resource "azurerm_lb_backend_address_pool" "backend-pool-lb" {
  name            = var.backend-pool-lb-name
  loadbalancer_id = var.load-balancer-id
}