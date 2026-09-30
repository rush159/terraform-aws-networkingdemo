# terraform-aws-networkingdemo
Networking Module Created by Rushabh while learning Terraform.

This module manages the creation of VPCs and Subnets, allowing for the creation of both private and public subnets.

Example usage : 

module "vpc" {
  source = "./modules/networking"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    Name       = "13-local-modules"
  }
  subnet_config = {
    private = {
      cidr_block = "10.0.0.0/24"
      az         = "ap-south-1a"
    }
    public_subnet = {
      cidr_block = "10.0.2.0/24"
      az         = "ap-south-1a"
      public     = true
    }
  }
}