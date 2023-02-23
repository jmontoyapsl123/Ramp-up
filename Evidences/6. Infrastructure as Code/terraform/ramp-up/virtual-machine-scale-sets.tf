module "virtual_machine_scale-set-auth" {
  source                                 = "../module/virtual_machine"
  resource_group_name                    = var.resource_name
  admin_user                             = "admin"
  admin_password                         = "Pasword123*"
  location                               = var.location
  subnet_id                              = module.vnet.subnet_ids[1]
  backend_address_pool_id                = module.backend-address-pool-auth.backend_address_pool_id
  prefix_name_vm                         = "vm-scale-set-auth"
  zone                                   = var.zone
  azurerm_virtual_machine_scale_set_name = "vm-scale-set-auth"
}

module "virtual_machine_scale-set-user" {
  source                                 = "../module/virtual_machine"
  resource_group_name                    = var.resource_name
  admin_user                             = "admin"
  admin_password                         = "Pasword123*"
  location                               = var.location
  subnet_id                              = module.vnet.subnet_ids[1]
  backend_address_pool_id                = module.backend-address-pool-user.backend_address_pool_id
  prefix_name_vm                         = "vm-scale-set-user"
  zone                                   = var.zone
  azurerm_virtual_machine_scale_set_name = "vm-scale-set-user"
}

module "virtual_machine_scale-set-todos" {
  source                                 = "../module/virtual_machine"
  resource_group_name                    = var.resource_name
  admin_user                             = "admin"
  admin_password                         = "Pasword123*"
  location                               = var.location
  subnet_id                              = module.vnet.subnet_ids[1]
  backend_address_pool_id                = module.backend-address-pool-todos.backend_address_pool_id
  prefix_name_vm                         = "vm-scale-set-todos"
  zone                                   = var.zone
  azurerm_virtual_machine_scale_set_name = "vm-scale-set-todos"
}

module "virtual_machine_scale-set-log" {
  source                                 = "../module/virtual_machine"
  resource_group_name                    = var.resource_name
  admin_user                             = "admin"
  admin_password                         = "Pasword123*"
  location                               = var.location
  subnet_id                              = module.vnet.subnet_ids[2]
  backend_address_pool_id                = module.backend-address-pool-redis-log.backend_address_pool_id
  prefix_name_vm                         = "vm-scale-set-log"
  zone                                   = var.zone
  azurerm_virtual_machine_scale_set_name = "vm-scale-set-log"
}