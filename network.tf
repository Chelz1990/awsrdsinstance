# create VPC
resource "aws_vpc" "tt-vpc" {
  cidr_block = "10.0.0.0/16"
}

# create public subnet
resource "aws_subnet" "tt-vm-sub" {
  vpc_id     = aws_vpc.tt-vpc.id
  cidr_block = "10.0.1.0/24"
}

# create route table
resource "aws_route_table" "tt-route" {
  vpc_id = aws_vpc.tt-vpc.id
}

# create internet gateway
resource "aws_internet_gateway" "tt-igw" {
  vpc_id = aws_vpc.tt-vpc.id
}

# associate igw with route table
resource "aws_route" "tt-public-igw" {
  route_table_id         = aws_route_table.tt-route.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.tt-igw.id
}

# create security group
resource "aws_security_group" "tt-sg" {
  name        = "3tier-security-group"
  vpc_id      = aws_vpc.tt-vpc.id
  
  dynamic "ingress" {
    for_each = [80,443,3306]
    iterator = port
    
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}