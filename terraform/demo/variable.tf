variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
  default = "AKKC_RG1"
}


variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
  default = "centralindia"
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
  default = "AK_VNet1"
}


variable "subnet1_name" {
  description = "The name of the subnet."
  type        = string
  default = "Subnet1"
}

variable "subnet2_name" {
  description = "The name of the subnet."
  type        = string
  default = "Subnet2"
  
}

