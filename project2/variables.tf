variable "rg_name" {
  type        = string
  description = "Name of the resource group"
  default     = "t2a-rg"
}

variable "rg_location" {
  type        = string
  description = "Location of the resource group"
  default     = "uksouth"
}

variable "vnet_name" {
  type        = string
  description = "Name of Vnet"
  default     = "t2a-vnet"
}

variable "subnet_name" {
  type = string
  description = "Name of subnet"
  default = "t2a-subnet"
}