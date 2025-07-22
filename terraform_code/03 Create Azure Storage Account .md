## Create Azure Storage Account-
``` 
# 1. Specify the version of the AzureRM Provider to use
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

# 2. Configure the AzureRM Provider

provider "azurerm" {
  features {}
  subscription_id = "your subscription_id"
  tenant_id       = "your tenant_id"
}

resource "azurerm_resource_group" "rg" {
  name     = "AKKC_B17_G2_DevOps"
  location = "eastus"
}

# create storage account-
resource "azurerm_storage_account" "storage_account" {
  name                     = "myazstorage1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```
