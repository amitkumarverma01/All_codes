resource "azurerm_resource_group" "rg1" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_resource_group" "rg2" {
    name     = "akkc"
    location = "eastus"
}

resource "azurerm_virtual_network" "vnet1" {
    name                = var.virtual_network_name
    resource_group_name = var.resource_group_name
    location            = var.location
    address_space       = ["192.168.0.0/24"]
}

resource "azurerm_subnet" "subnet1" {
    name                 = "subnet1"
    resource_group_name  = azurerm_resource_group.rg1.name
    virtual_network_name = azurerm_virtual_network.vnet1.name
    address_prefixes     = ["192.168.0.0/24"]
}

resource "azurerm_storage_account" "storage1" {
    name                     = "akkc1storageaccount"
    resource_group_name      = azurerm_resource_group.rg1.name
    location                 = azurerm_resource_group.rg1.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_public_ip" "public_ip" {
    name                = "publicIP"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name
    allocation_method   = "Static"
}

resource "azurerm_network_security_group" "nsg" {
    name                = "nsg"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name

    security_rule {
        name                       = "RDP"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}

resource "azurerm_network_interface" "nic" {
    name                = "nic"
    location            = azurerm_resource_group.rg1.location
    resource_group_name = azurerm_resource_group.rg1.name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.subnet1.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.public_ip.id
    }
}

resource "azurerm_network_interface_security_group_association" "nsg_association" {
    network_interface_id      = azurerm_network_interface.nic.id
    network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_windows_virtual_machine" "wvm" {
  name                = "WS2016"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  size                = "Standard_F2"
  admin_username      = "akkc"
  admin_password      = "Surveillance1@123"
  network_interface_ids = [azurerm_network_interface.nic.id,]
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}