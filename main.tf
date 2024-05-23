provider "azurerm" {
  features {}
}
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.13"
}
provider "aws" {
  region = var.aws_region
}

module "azure_vnet" {
  source            = "./modules/azure_vnet"
  vnet_name         = "${var.prefix}-vnet"
  subnet_name       = "${var.prefix}-subnet"
  resource_group    = var.resource_group
  location          = var.location
  address_space     = var.address_space
  subnet_prefix     = var.subnet_prefix
}
module "azure_vm" {
  source            = "./modules/azure_vm"
  vm_name           = "${var.prefix}-vm"
  resource_group    = var.resource_group
  location          = var.location
  vnet_name         = module.azure_vnet.vnet_name
  subnet_name       = module.azure_vnet.subnet_name
  admin_username    = var.admin_username
  admin_password    = var.admin_password
}
module "aws_s3" {
  source            = "./modules/aws_s3"
  bucket_name       = "${var.prefix}-bucket"
  aws_region        = var.aws_region
}
