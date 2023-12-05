resource "random_string" "password" {
  length           = 16
  special          = true
  upper            = true
  min_numeric = 4
  lower = true
}

resource "aws_db_instance" "ttplaydbserver" {
  engine         = "mysql"
  engine_version = "5.7"
  allocated_storage    =  20
  instance_class = "db.t2.micro"
  username       = "admin"
  password       = "${random_string.password.result}"
  skip_final_snapshot  = true
  publicly_accessible =  true
}