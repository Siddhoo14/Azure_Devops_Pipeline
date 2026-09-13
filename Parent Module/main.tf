module "resource_group" {
  source              = "../Child Module/azurerm_resource_group"
  resource_group_name = var.resource_group_name
}
module "storage_account" {
  depends_on            = [module.resource_group]
  source                 = "../Child Module/azurerm_storage_account"
  storage_account_name = var.storage_account_name
}
module "virtual_network" {
  depends_on      = [module.resource_group]
  source           = "../Child Module/azurerm_virtual_network"
  virtual_networks = var.virtual_networks
}
module "subnet" {
  depends_on    = [module.virtual_network]
  source  = "../Child Module/azurerm_subnet"
  subnets = var.subnets
}
module "public_ips" {
  depends_on    = [module.resource_group]
  source = "../Child Module/azurerm_public_ip"
  public_ips = var.public_ips
}
module "nic_card" {
  depends_on    = [module.subnet, module.public_ips]
  source        = "../Child Module/azurerm_nic"
  nic_cards     = var.nic_cards
  subnet_ids    = module.subnet.subnet_ids
  public_ip_ids = module.public_ips.public_ip_ids
}
module "virtual_machine"{
  depends_on    = [module.nic_card]
  source = "../Child Module/azurerm_virtual_machine"
  virtual_machines = var.virtual_machines
  nic_card_ids = module.nic_card.nic_card_ids
}