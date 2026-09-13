resource_group_name = {
  rg1 = {
    name     = "rg1"
    location = "centralindia"
  }
}
storage_account_name = {
  sa1 = {
    name                     = "chutiyastoragebana"
    location                 = "centralindia"
    resource_group_name      = "rg1"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
virtual_networks = {
  vnet1 = {
    name                = "vnet1"
    location            = "centralindia"
    resource_group_name = "rg1"
    address_space       = ["10.0.0.0/16"]
  }
}
subnets = {
  subnet1 = {
    name                 = "subnet1"
    resource_group_name  = "rg1"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
}
public_ips = {
  publicip1 = {
    name                = "publicip1"
    location            = "centralindia"
    resource_group_name = "rg1"
    allocation_method   = "Static"
  }
}
nic_cards = {
  nic1 = {
    name                = "nic1"
    location            = "centralindia"
    resource_group_name = "rg1"
    ip_configuration = {
      name                          = "ipconfig1"
      subnet_key                    = "subnet1"
      private_ip_address_allocation = "Dynamic"
      public_ip_key                 = "publicip1"
    }
  }
}
virtual_machines = {
    vm1={
        name = "vm1"
        location = "centralindia"
        resource_group_name = "rg1"
        network_interface_key = "nic1"
        vm_size = "Standard_D2s_v3"
        storage_image_reference = {
            publisher = "Canonical"
            offer     = "UbuntuPro"
            sku       = "24.04-LTS"
            version   = "latest"
        }
        os_profile = {
            computer_name  = "hostname"
            admin_username = "azureuser"
            admin_password = "Mumbai@123456789"
        }
        storage_os_disk = {
            name              = "myosdisk1"
            caching           = "ReadWrite"
            create_option     = "FromImage"
            managed_disk_type = "Standard_LRS"
        }
        os_profile_linux_config = {
            disable_password_authentication = false
        }
    }
}
