terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.65.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "t2a-rg" {
  name     = var.rg_name
  location = var.rg_location
}

resource "azurerm_virtual_network" "T2A-vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.t2a-rg.location
  resource_group_name = azurerm_resource_group.t2a-rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["8.8.8.8", "8.8.4.4"]
}