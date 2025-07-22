resource "azurerm_resource_group" "example" {
  name     = "feature1"
  location = "West Europe"
}

resource "azurerm_resource_group" "example1" {
  name     = "feature2"
  location = "West Europe2"
}
resource "azurerm_resource_group" "example" {
  name     = "feature1"
  location = "West Europe"
}

resource "azurerm_resource_group" "example1" {
  name     = "feature1"
  location = "West Europe"
}