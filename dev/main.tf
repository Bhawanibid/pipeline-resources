module "resource_group" {
  source = "../module/resource_group"
  rg_name =var.rg_name
  location = var.location
}

module "virtual_network" {
  source = "../module/vnet"
  depends_on = [module.resource_group ]
  vnet_name = var.vnet_name
  location = var.location
  rg_name = var.rg_name
}

module "subnet" {
  source = "../module/subnet"
  depends_on = [ module.virtual_network]
  subnet_name = var.subnet_name
  rg_name = var.rg_name
  vnet_name = var.vnet_name
}

module "publice_ip" {
  source = "../module/public_ip"
  depends_on = [ module.resource_group ]
  pip_name = var.pip_name
  rg_name = var.rg_name
  location = var.location
}

module "virtual_machine_front" {
  source = "../module/Virtual_machine"
  depends_on = [module.publice_ip,module.subnet]
  rg_name = var.rg_name
  location = var.location
  nic_name = var.nic_name
  vnet_name = var.vnet_name
  vm_name = var.vnet_name
}