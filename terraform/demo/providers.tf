terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }
}

provider "azurerm" {
  features {
    virtual_machine {
        delete_os_disk_on_deletion = true
    }
  }
  subscription_id = "f85ee25f-ffbe-4145-896a-4a245999982e"
}