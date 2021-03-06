terraform {
  required_providers {
    azuredevops = {
      source  = "registry.terraform.io/microsoft/azuredevops"
      version = ">=0.1.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"

    }

    azuread = {
      source = "hashicorp/azuread"
      version = "~> 1.0"
    }

  }
  backend "remote" {
    organization = "archicat"

    workspaces {
      name = "CICDwTF"
    }
  }
}