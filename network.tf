locals {
    vpc_id = aws_vpc.id
}

resource "aws_vpc" "3tier_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "3tier_sg" {
  name        = "3tier-security-group"
  vpc_id      = local.vpc_id

  dynamic "ingress" {

    for_each = var.ingress_ports
    content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = tcp
        cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

data "aws_internet_gateway" "3tier_igw" {
  filter {
    name   = "attachment.vpc-id"
    values = local.vpc_id
  }
}