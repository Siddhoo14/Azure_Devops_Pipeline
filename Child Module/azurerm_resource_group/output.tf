output "resource_group_id"{
  description = "The ID of the resource group"
  value = {
    for k, rg in azurerm_resource_group.rg : k => rg.id
  }
}
