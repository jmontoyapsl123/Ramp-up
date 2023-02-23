output "subnet_ids" {
  value = values(azurerm_subnet.subnet)[*].id
}