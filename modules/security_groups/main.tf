resource "aws_security_groups" "earpz-sg" {
  vpc_id = var.earpz-vpc-id
  name   = "earpz-sg"
}
variable "earpz-vpc-id" {
  type    = string
  default = "earpz-vpc-id"
}