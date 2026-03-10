resource "aws_vpc" "earpz-vpc" {
  cidr_block = var.earpz-cidr

  tags = merge({ Name = var.earpz-vpc-name }, var.tags)
}
variable "earpz-cidr" {
  type    = string
  default = "192.168.0.0/16"
}
variable "earpz-vpc-name" {
  type    = string
  default = "earpz-vpc-name"
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "earpz-env" {
  type = string
  default = "dev"
}
output "earpz_vpc_id" {
  value = aws_vpc.earpz-vpc.id
}
output "vpc_cidr" {
  value = var.earpz-cidr
}
output "earpz-env" {
  value = var.earpz-env
}