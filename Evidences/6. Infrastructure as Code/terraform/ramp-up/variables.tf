variable "location" {
  type    = string
  default = "East US"
}

variable "zone" {
  type    = string
  default = "eastus"
}
variable "subscription_id" {
  type    = string
  default = "755c613f-dfb0-4080-821a-2796e6cf28f6"
}

variable "subnet_address_prefix" {
  type = map(any)
  default = {
    sub-1 = {
      name    = "sbn_front"
      address = "192.168.1.0/24"
    }
    sub-2 = {
      name    = "sbn_services"
      address = "192.168.2.0/24"
    }
    sub-3 = {
      name    = "sbn_redis"
      address = "192.168.3.0/24"
    }
  }
}

variable "resource_name" {
  type    = string
  default = "j.montoya_rg"
}