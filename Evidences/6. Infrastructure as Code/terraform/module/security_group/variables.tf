variable "location" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "rg_name" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "priority" {
  type = number
}

variable "direction" {
  type = string
}

variable "access" {
  type = string
}

variable "protocol" {
  type = string
}

variable "destination_port_range" {
  type = string
}

variable "source_port_range" {
  type = string
}