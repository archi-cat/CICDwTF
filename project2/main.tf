terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.65.0"
    }
  }
}

terraform {
  backend "azure" {
    resource_group_name  = "tf-tfstate"
    storage_account_name = "tfstateblobacc1"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
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

resource "azurerm_subnet" "T2A-subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.t2a-rg.name
  virtual_network_name = azurerm_virtual_network.T2A-vnet.name
  address_prefix = "10.0.1.0/24"
}