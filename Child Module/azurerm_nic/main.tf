resource "azurerm_network_interface" "nic_card"{
    for_each = var.nic_cards
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = var.subnet_ids[each.value.ip_configuration.subnet_key]
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = var.public_ip_ids[each.value.ip_configuration.public_ip_key]
  }
}