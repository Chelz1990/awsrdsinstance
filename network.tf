locals {
    vpc_id = aws_vpc.id
}

resource "aws_vpc" "tt-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "tt-sg" {
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

data "aws_internet_gateway" "tt-gw" {
  filter {
    name   = "3tier-igw"
    values = local.vpc_id
  }
}