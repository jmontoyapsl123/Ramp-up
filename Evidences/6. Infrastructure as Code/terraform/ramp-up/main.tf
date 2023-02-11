terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.93.0"
    }
  }
}
provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

module "rg" {
  source        = "../module/resource_group"
  resource_name = "j.montoya_rg"
  location      = var.location
  tags = {
    Name = "j.montoya_rg"
  }
}

module "vnet" {
  source                = "../module/vnet"
  vn_name               = "vnet_ramp_up_j.montoya"
  location              = var.location
  address_space         = ["192.168.0.0/16"]
  dns_servers           = ["192.168.0.4", "192.168.0.5"]
  resource_group_name   = module.rg.resource_name
  subnet_address_prefix = var.subnet_address_prefix
  tags = {
    Name = "vnet_ramp_up"
  }
}

module "front_lb_module" {
  source        = "../module/load_balancer"
  lb_name       = "front-lb"
  location      = var.location
  resource_name = module.rg.resource_name
  subnet_id     = module.vnet.subnet_ids[0]
}

