resource "aws_security_group" "earpz-sg" {
  vpc_id    = var.earpz-vpc-id
  count = var.earpz_create_sg ? 1 : 0
  name      = "earpz-sg"
  tags = {
    Name = join("-", ["earpz", "sg"])
  }
}
variable "earpz-vpc-id" {
  type    = string
  default = "earpz-vpc-id"
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
/*
### create tagzzz ###
variable "logging" {
    type = bool
    default = true
*/