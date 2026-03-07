module "aws_vpc" {
  source         = "./modules/vpc"
  earpz-cidr     = var.dev-earpz-cidr
  earpz-vpc-name = var.dev-earpz-vpc-name

  tags = {
    Name        = var.dev-earpz-vpc-name
    Environment = "dev"
    Owner       = "earpz"
  }
}
variable "dev-earpz-cidr" {
  type    = string
  default = "192.168.0.0/16"
}
variable "dev-earpz-vpc-name" {
  type    = string
  default = "earpz-vpc-name"
}
output "earpz-vpc" {
  value = module.aws_vpc.earpz_vpc_id
}
output "earpz_vpc_cidr" {
  value = module.aws_vpc.vpc_cidr
}
###############################################
module "aws_subnets" {
  source             = "./modules/subnets"
  earpz-subnet-alias = var.subnet_name
  earpz-az           = var.availability_zone
  earpz_vpc_id       = module.aws_vpc.earpz_vpc_id

  tags = {
    Name        = var.dev-earpz-vpc-name
    Environment = "dev"
    Owner       = "earpz"
  }
}
variable "subnet_name" {
  type    = string
  default = "earpz-vpc-name"
}
variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}
output "module_igw_alias" {
  value = module.aws_subnets.subnet-igw-name
}
output "module-subnet-igw" {
  value = module.aws_subnets.subnet_vpc_id
}
output "module-subnet_vpc_id" {
  value = module.aws_subnets.subnet_vpc_id
}
###############################################
module "aws_security_groups" {
  source          = "./modules/security_groups"
  earpz-vpc-id    = module.aws_vpc.earpz_vpc_id
  earpz_create_sg = var.module_create_sg
}
variable "module_create_sg" {
  type    = bool
  default = false
}
output "module_create_sg" {
  value = module.aws_security_groups.earpz_create_sg
}