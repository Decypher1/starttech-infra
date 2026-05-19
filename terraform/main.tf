terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source = "./modules/networking"

  vpc_cidr              = var.vpc_cidr
  public_subnet_1_cidr = var.public_subnet_1_cidr
  public_subnet_2_cidr = var.public_subnet_2_cidr
  private_subnet_1_cidr = var.private_subnet_1_cidr
  private_subnet_2_cidr = var.private_subnet_2_cidr

  az_1 = var.az_1
  az_2 = var.az_2
}

module "compute" {
  source = "./modules/compute"

  vpc_id = module.networking.vpc_id

  public_subnet_1_id = module.networking.public_subnet_1_id
  public_subnet_2_id = module.networking.public_subnet_2_id

  private_subnet_1_id = module.networking.private_subnet_1_id
  private_subnet_2_id = module.networking.private_subnet_2_id

  ami_id       = var.ami_id
  instance_type = var.instance_type
  key_name     = var.key_name

  ecr_repository_url = module.storage.ecr_repository_url
}

module "storage" {
  source = "./modules/storage"
}