## Create RG, VNET, SUBNET, NSG, Public IP, Network Interface---
### Create a RG-
``` 
resource "azurerm_resource_group" "example" {
  name     = "my_rg_01"
  location = "centralindia"
}
```
### Create a Virtual Network(VNET)-
``` 
resource "azurerm_virtual_network" "example" {
  name                = "my_network"
  address_space       = ["192.168.2.0/24"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
```
### Create A Subnet-
``` 
resource "azurerm_subnet" "example" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["192.168.2.0/25"]
}
```
### Create a Public IP-
``` 
resource "azurerm_public_ip" "example" {
  name                = "my_vm_01_PublicIp1"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
  }
```
### Network Security Group-
``` 
resource "azurerm_network_security_group" "example" {
  name                = "my_nsg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
```
### Create a Network interface-
``` 

resource "azurerm_network_interface" "example" {
  name                = "my_vm-nic1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}
```

### Network Security Group Association-
``` 
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}
```
### Create a Virtual Machine-
``` 
resource "azurerm_virtual_machine" "example" {
  name                  = "my_ubuntu_vm"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = "Standard_DS1_v2"

   delete_os_disk_on_termination = true
   delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "akkc"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
```

## Take Public IP as Output-
``` 
data "azurerm_public_ip" "example" {
  name                = azurerm_public_ip.example.name
  resource_group_name = azurerm_virtual_machine.example.resource_group_name
}

output "public_ip_address" {
  value = data.azurerm_public_ip.example.ip_address
}

```
