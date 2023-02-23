variable "location" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "vn_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "dns_servers" {
  type = list(string)
}

variable "subnet_address_prefix" {
  type = map(any)
}