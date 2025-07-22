terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.23.0"
    }
  }

# we use the azurerm backend to store the Terraform state file in an Azure Storage Account.




}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "b7df65c6-7c4d-4e35-983d-cd66eea0573a"
  # client_id       = "a55665df-4001-4e2e-8975-860cbc1eaf0f"
  # client_secret   = var.client_secret
  # tenant_id       = "628e55e0-ddbc-4fb1-84df-bb0350248525"
}