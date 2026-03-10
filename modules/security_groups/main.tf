resource "aws_security_group" "earpz-sg" {
  vpc_id    = var.earpz-vpc-id
  count = var.earpz_create_sg ? 1 : 0
  name      = var.earpz-sg-name
  tags = {
    Name = join("-", ["earpz", "sg"])
  }
}
variable "earpz-vpc-id" {
  type    = string
  default = "earpz-vpc-id"
}
variable "earpz-sg-name" {
  type = string
  default = "earp-sg"
}
variable "earpz_create_sg" {
  type    = bool
  default = false
}
variable "tags" {
  type = map(string)
  default = {}
}

output "earpz_create_sg" {
  value = var.earpz_create_sg
}
output "earpz-sg-name" {
  value = var.earpz-sg-name
}