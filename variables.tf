variable "prefix" {
  description = "Prefix for naming convention"
  type = string
}
variable "resource_group" {
  description = "Azure resource group name"
  type = string
}
variable "location" {
  description = "Azure region"
  type = string
}
variable "address_space" {
  description = "VM IP address"
  type = list(string)
}
variable "subnet_prefix" {
    description = "Subnet IP address"
    type = string
}
variable "admin_username" {
  description = "Admin username of vm"
  type = string
}
variable "admin_password" {
  description = "Pwd of vm"
  type = string
}
variable "bucket_name" {
  description = "s3 bucket name"
  type = string
}
variable "aws_region" {
  description = "AWS region"
  type = string
}
