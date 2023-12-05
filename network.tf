resource "aws_vpc" "tt-vpc" {
  cidr_block = "10.0.0.0/16"
}

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