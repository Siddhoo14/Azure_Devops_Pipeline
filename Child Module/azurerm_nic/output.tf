output "nic_card_ids" {
  value = {
    for k , nic in azurerm_network_interface.nic_card : k => nic.id
  }
}