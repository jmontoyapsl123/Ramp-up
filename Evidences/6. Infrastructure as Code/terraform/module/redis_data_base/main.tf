resource "azurerm_redis_cache" "redis" {
  name                = "log-ramp-up"
  location            = var.location
  resource_group_name = var.resource-group-name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
  subnet_id           = var.subnet_id
  redis_configuration {
    maxmemory_reserved = 2
    maxmemory_delta    = 2
    maxmemory_policy   = "allkeys-lru"
  }
}