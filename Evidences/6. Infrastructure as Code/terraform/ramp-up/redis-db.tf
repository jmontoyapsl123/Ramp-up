module "back_log_redis_lb" {
  source              = "../module/internal_load_balancer"
  location            = var.location
  resource-group-name = var.resource_name
  subnet_id           = module.vnet.subnet_ids[2]
  ip_address_lb       = "192.168.3.5"
  internal-name-lb    = "back-log-redis-lb"
}

module "probe-log-lb" {
  source              = "../module/probe_load_balancer"
  resource-group-name = var.resource_name
  load-balancer-id    = module.back_log_redis_lb.lb_internal_id
  probe-name-lb       = "back-log-probe-lb"
  probe-port-lb       = 6379
}

module "network-interface-redis-log" {
  source                = "../module/network_interface"
  location              = var.location
  resource-group-name   = var.resource_name
  network_name          = "network-interface-log-redis"
  ip_configuration_name = "ip-config-log-redis"
  private_ip            = "192.168.3.10"
  subnet_id             = module.vnet.subnet_ids[2]
}

module "backend-address-pool-redis-log" {
  source               = "../module/back_address_pool"
  backend-pool-lb-name = "back-redis-pool-lb"
  resource-group-name  = var.resource_name
  load-balancer-id     = module.back_log_redis_lb.lb_internal_id
}

module "network-interface-pool-redis-log" {
  source                  = "../module/network_interface_backend_Address"
  backend_address_pool_id = module.backend-address-pool-redis-log.backend_address_pool_id
  ip_configuration_name   = "ip-config-log-redis"
  network_interface_id    = module.network-interface-redis-log.network_interface_id
}

/*module "redis-db" {
  source              = "../module/redis_data_base"
  location            = var.location
  resource-group-name = module.rg.resource_name
  subnet_id           = module.vnet.subnet_ids[2]

}*/