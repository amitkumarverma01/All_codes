# variable "client_secret" {
#   description = "The client secret for the service principal"
#   type        = string
#   sensitive   = false
#   # sensitive = false
# }

variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  type        = string

}

variable "location" {
  description = "The location/region where the resources will be created"
  type        = string
}

variable "virtual_network_name1" {
  description = "The name of the virtual network in which the resources will be created"
  type        = string
}

variable "virtual_network_name2" {
  description = "The name of the virtual network in which the resources will be created"
  type        = string
}


variable "subnet1" {
  description = "The name of the subnet in which the resources will be created"
  type        = string
 
}


variable "subnet2" {
  description = "The name of the subnet in which the resources will be created"
  type        = string

}