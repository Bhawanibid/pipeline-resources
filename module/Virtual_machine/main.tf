resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    public_ip_address_id          = data.azurerm_public_ip.pip-data.id
    subnet_id                     = data.azurerm_subnet.data-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

data "azurerm_public_ip" "pip-data" {
  name                = "data_public_ip"
  resource_group_name = var.rg_name
}

data "azurerm_subnet" "data-subnet" {
  name                 = "backend"
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
