variable "resource_group_name" {
  type = string
}

variable "admin_user" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "backend_address_pool_id" {
  type = string
}

variable "prefix_name_vm" {
  type = string
}

variable "zone" {
  type = string
}

variable "azurerm_virtual_machine_scale_set_name" {
  type = string
}
