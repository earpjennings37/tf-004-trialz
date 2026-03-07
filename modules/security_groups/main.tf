resource "aws_security_group" "earpz-sg" {
  vpc_id    = var.earpz-vpc-id
  name      = "earpz-sg"
}
variable "earpz-vpc-id" {
  type    = string
  default = "earpz-vpc-id"
}
variable "earpz_create_sg" {
  type    = bool
  default = false
}
output "earpz_create_sg" {
  value = var.earpz_create_sg
}