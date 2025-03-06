# # Create Resource Group
# resource "azurerm_resource_group" "terraform" {
#   name     = "terraform-resource-group"
#   location = "East US"
# }

# # Create Virtual Network
# resource "azurerm_virtual_network" "terraform" {
#   name                = "terraform-vnet"
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.terraform.location
#   resource_group_name = azurerm_resource_group.terraform.name
# }

# # Create Subnet
# resource "azurerm_subnet" "terraform" {
#   name                 = "terraform-subnet"
#   resource_group_name  = azurerm_resource_group.terraform.name
#   virtual_network_name = azurerm_virtual_network.terraform.name
#   address_prefixes     = ["10.0.1.0/24"]
# }

# # Create Public IP for VM
# resource "azurerm_public_ip" "terraform" {
#   name                = "terraform-vm-public-ip"
#   resource_group_name = azurerm_resource_group.terraform.name
#   location            = azurerm_resource_group.terraform.location
#   allocation_method   = "Static"
# }

# # Create Network Interface for VM
# resource "azurerm_network_interface" "terraform" {
#   name                = "terraform-nic"
#   resource_group_name = azurerm_resource_group.terraform.name
#   location            = azurerm_resource_group.terraform.location

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.terraform.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.terraform.id
#   }
# }

# # Automatically Generate SSH Key Pair
# resource "tls_private_key" "terraform" {
#   algorithm = "RSA"
#   rsa_bits  = 2048
# }

# # Create Virtual Machine
# resource "azurerm_linux_virtual_machine" "terraform" {
#   name                = "terraform-vm"
#   resource_group_name = azurerm_resource_group.terraform.name
#   location            = azurerm_resource_group.terraform.location
#   size                = "Standard_B2s"
#   admin_username      = "azureuser"

#   # This SSH key should be replaced with your own public key
#   admin_ssh_key {
#     username   = "azureuser"
#     public_key = tls_private_key.terraform.public_key_openssh
#   }

#   network_interface_ids = [
#     azurerm_network_interface.terraform.id,
#   ]

#   os_disk {
#     name                 = "terraform-os-disk"
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

 
#    source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
# }

  
# }
