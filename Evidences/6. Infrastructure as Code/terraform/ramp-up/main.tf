terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = "65ff0442-1fc6-4246-8670-f4ffa024c882"
  client_secret   = "yWz8Q~KC2sYXnFadI5_fX68irdreYmZ6pcvUSctO"
  tenant_id       = "056ae0bd-2879-463a-b581-e84180975c0d"
  features {}
}

data "azurerm_resources" "resource_group" {
  resource_group_name = var.resource_name
}

module "vnet" {
  source                = "../module/vnet"
  vn_name               = "vnet_ramp_up_j.montoya"
  location              = var.location
  address_space         = ["192.168.0.0/16"]
  dns_servers           = ["192.168.0.4", "192.168.0.5"]
  resource_group_name   = var.resource_name
  subnet_address_prefix = var.subnet_address_prefix
  tags = {
    Name        = "vnet_ramp_up"
    Proyecto    = "Ramp_up"
    Responsable = "jmontoya_ramp_up"
  }
}

module "front_lb_module" {
  source        = "../module/load_balancer"
  lb_name       = "front-lb"
  location      = var.location
  resource_name = var.resource_name
  subnet_id     = module.vnet.subnet_ids[0]
}

