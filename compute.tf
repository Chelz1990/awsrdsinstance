resource "aws_instance" "3tier_pbface" {
  ami           = HERE
  instance_type = "t3.micro"
}