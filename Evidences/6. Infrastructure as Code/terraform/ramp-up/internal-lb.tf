module "back_lb_module" {
  source              = "../module/internal_load_balancer"
  location            = var.location
  resource-group-name = var.resource_name
  subnet_id           = module.vnet.subnet_ids[1]
  ip_address_lb       = "192.168.2.10"
  internal-name-lb    = "back-lb"
}

module "probe-auth-lb" {
  source              = "../module/probe_load_balancer"
  resource-group-name = var.resource_name
  load-balancer-id    = module.back_lb_module.lb_internal_id
  probe-name-lb       = "back-auth-probe-lb"
  probe-port-lb       = 8000
}

module "probe-user-lb" {
  source              = "../module/probe_load_balancer"
  resource-group-name = var.resource_name
  load-balancer-id    = module.back_lb_module.lb_internal_id
  probe-name-lb       = "back-user-probe-lb"
  probe-port-lb       = 8083
}

module "probe-todos-lb" {
  source              = "../module/probe_load_balancer"
  resource-group-name = var.resource_name
  load-balancer-id    = module.back_lb_module.lb_internal_id
  probe-name-lb       = "back-todos-probe-lb"
  probe-port-lb       = 8082
}

module "network-interface-auth" {
  source                = "../module/network_interface"
  location              = var.location
  resource-group-name   = var.resource_name
  network_name          = "network-interface-auth"
  ip_configuration_name = "ip-config-auth"
  private_ip            = "192.168.2.11"
  subnet_id             = module.vnet.subnet_ids[1]
}

module "backend-address-pool-auth" {
  source               = "../module/back_address_pool"
  backend-pool-lb-name = "back-auth-pool-lb"
  resource-group-name  = var.resource_name
  load-balancer-id     = module.back_lb_module.lb_internal_id
}

module "network-interface-pool-auth" {
  source                  = "../module/network_interface_backend_Address"
  backend_address_pool_id = module.backend-address-pool-auth.backend_address_pool_id
  ip_configuration_name   = "ip-config-auth"
  network_interface_id    = module.network-interface-auth.network_interface_id
}

module "network-interface-user" {
  source                = "../module/network_interface"
  location              = var.location
  resource-group-name   = var.resource_name
  network_name          = "network-interface-user"
  ip_configuration_name = "ip-config-user"
  private_ip            = "192.168.2.12"
  subnet_id             = module.vnet.subnet_ids[1]
}

module "backend-address-pool-user" {
  source               = "../module/back_address_pool"
  backend-pool-lb-name = "back-user-pool-lb"
  resource-group-name  = var.resource_name
  load-balancer-id     = module.back_lb_module.lb_internal_id
}

module "network-interface-pool-user" {
  source                  = "../module/network_interface_backend_Address"
  backend_address_pool_id = module.backend-address-pool-user.backend_address_pool_id
  ip_configuration_name   = "ip-config-user"
  network_interface_id    = module.network-interface-user.network_interface_id
}

module "network-interface-todos" {
  source                = "../module/network_interface"
  location              = var.location
  resource-group-name   = var.resource_name
  network_name          = "network-interface-todos"
  ip_configuration_name = "ip-config-todos"
  private_ip            = "192.168.2.13"
  subnet_id             = module.vnet.subnet_ids[1]
}

module "backend-address-pool-todos" {
  source               = "../module/back_address_pool"
  backend-pool-lb-name = "back-todos-pool-lb"
  resource-group-name  = var.resource_name
  load-balancer-id     = module.back_lb_module.lb_internal_id
}

module "network-interface-pool-todos" {
  source                  = "../module/network_interface_backend_Address"
  backend_address_pool_id = module.backend-address-pool-todos.backend_address_pool_id
  ip_configuration_name   = "ip-config-todos"
  network_interface_id    = module.network-interface-todos.network_interface_id
}