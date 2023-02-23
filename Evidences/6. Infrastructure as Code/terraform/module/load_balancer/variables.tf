variable "location" {
  type    = string
  default = "East US"
}

variable "subscription_id" {
  type    = string
  default = "755c613f-dfb0-4080-821a-2796e6cf28f6"
}

variable "lb_name" {
  type    = string
  default = "tier-lb"
}

variable "resource_name" {
  type = string
}

variable "subnet_id" {
  type = string
}