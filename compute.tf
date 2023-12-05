resource "aws_instance" "tt-vm" {
  ami           = "ami-0fa1ca9559f1892ec"
  instance_type = "t3.micro"
  user_data = <<HEREDOC
  
  #!/bin/bash
  echo "hello world"

  HEREDOC
}