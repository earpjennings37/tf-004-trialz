module "aws_vpc" {
  source         = "./modules/vpc"
  earpz-cidr     = var.dev-earpz-cidr
  earpz-vpc-name = var.dev-earpz-vpc-name

  tags = {
    Name        = "${var.dev-earpz-vpc-name}-${var.environment}"
    Environment = var.environment
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
variable "environment" {
  type    = string
  default = "dev"
}
output "module-vpc-env-name" {
  value = module.aws_vpc.earpz-env
}
output "module-vpc-secret" {
  value = var.dev-earpz-vpc-name
  sensitive = true
}
###############################################
module "aws_subnets" {
  source             = "./modules/subnets"
  earpz-subnet-alias = var.subnet_name
  earpz-az           = var.availability_zone
  earpz_vpc_id       = module.aws_vpc.earpz_vpc_id

  tags = {
    Name = "${var.subnet_name}-${var.environment}"
  }
}
variable "subnet_name" {
  type    = string
  default = "earpz-subnet"
}
variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}
output "module-igw-alias" {
  value = "${module.aws_subnets.subnet-igw-name}-${module.aws_vpc.earpz-env}"
}
###############################################
module "aws_security_groups" {
  source          = "./modules/security_groups"
  earpz-vpc-id    = module.aws_vpc.earpz_vpc_id
  earpz_create_sg = var.module_create_sg
  tags = {
    Name = "earp-sg-${var.environment}"
        Environment = var.environment
  }
}
variable "module_create_sg" {
  type    = bool
  default = false
}
output "module_create_sg" {
  value = module.aws_security_groups.earpz_create_sg
}
output "module-earpz-sg-env" {
  value = module.aws_vpc.earpz-env
}
output "module-earpz-sg-name" {
  value = "${module.aws_security_groups.earpz-sg-name}-${var.environment}"
}