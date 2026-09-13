output "virtual_network_id"{
  description = "The ID of the virtual network"
  value = values(azurerm_virtual_network.sample-vnet)[*].id
}