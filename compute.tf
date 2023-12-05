resource "aws_instance" "tt-pbface" {
  ami           = "ami-0fa1ca9559f1892ec"
  instance_type = "t3.micro"
}