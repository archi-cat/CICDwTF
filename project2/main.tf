resource "azurerm_resource_group" "t2a-rg" {
    name = var.rg_name
    location = var.rg_location  
}