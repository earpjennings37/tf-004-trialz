module "aws_vpc" {
  source         = "./modules/vpc"
  earpz-cidr     = var.dev-earpz-cidr
  earpz-vpc-name = var.dev-earpz-vpc-name

  tags = {
    Name = var.dev-earpz-vpc-name
        Environment = "dev"
    Owner       = "Earp"
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
module "aws_subnets" {
  source             = "./modules/subnets"
  earpz-subnet-alias = var.subnet_name
  az                 = var.availability_zone
  earpz_vpc_id       = module.aws_vpc.earpz_vpc_id

  tags = {
    Name        = var.dev-earpz-vpc-name
    Environment = "dev"
    Owner       = "Earp"
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
output "earpz-vpc" {
  value = module.aws_vpc.earpz_vpc_id
}
output "igw_alias" {
  value = module.aws_subnets.subnet-igw-name
}