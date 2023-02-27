resource "azurerm_virtual_machine_scale_set" "vitual-machine-scale-set" {
  name                = var.azurerm_virtual_machine_scale_set_name
  location            = var.location
  resource_group_name = var.resource_group_name
  upgrade_policy_mode = "Manual"

  zones = [var.zone]

  sku {
    name     = "Standard_B1S"
    tier     = "Standard"
    capacity = 2
  }

  storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_profile_data_disk {
    lun           = 0
    caching       = "ReadWrite"
    create_option = "Empty"
    disk_size_gb  = 10
  }

  os_profile {
    computer_name_prefix = var.prefix_name_vm
    admin_username       = var.admin_user
    admin_password       = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  network_profile {
    name    = "network_profile_vm"
    primary = true

    ip_configuration {
      name                                   = "IPConfiguration"
      subnet_id                              = var.subnet_id
      load_balancer_backend_address_pool_ids = [var.backend_address_pool_id]
      primary                                = true
    }
  }

  tags = {
    Responsable = "jmontoya-ramp-up"
    Proyecto    = "ramp-up"
    Creator     = "jmontoya"
  }

}