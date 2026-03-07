resource "aws_subnet" "earpz-subnet" {
  vpc_id            = var.earpz_vpc_id
  cidr_block        = var.earpz-cidr-subnet
  availability_zone = var.earpz-az
  tags              = merge({ Name = var.earpz-subnet-alias }, var.tags)
}
variable "earpz_vpc_id" {
  type = string
}
variable "earpz-cidr-subnet" {
  type    = string
  default = "192.168.1.0/24"
}
variable "earpz-az" {
  type    = string
  default = "us-east-1b"
}
variable "earpz-subnet-alias" {
  type    = string
  default = "earpz-subnet-alias"
}
variable "tags" {
  type    = map(string)
  default = {}
}
output "subnet_vpc_id" {
  value = var.earpz_vpc_id
}
###############################################
resource "aws_internet_gateway" "earpz-igw" {
  vpc_id = var.earpz_vpc_id
  tags = {
    Name = "${var.earpz-subnet-alias}-igw"
  }
}
output "subnet-igw-name" {
  value = "${var.earpz-subnet-alias}-igw"
}
output "igw_id" {
  value = aws_internet_gateway.earpz-igw.id
}