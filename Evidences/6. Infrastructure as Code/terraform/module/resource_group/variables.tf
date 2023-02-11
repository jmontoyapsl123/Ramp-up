variable "location" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "resource_name" {
  type    = string
  default = "rg_rampup"
}