resource "random_string" "login" {
  length           = 8
  special          = false
  override_special = "/@£$"
  upper            = false
}

resource "random_string" "password" {
  length           = 16
  special          = true
  upper            = true
  min_numeric = 4
  lower = true
}

resource "aws_db_instance" "dbserver" {
  engine         = "mysql"
  engine_version = "5.7"
  allocated_storage    =  20
  instance_class = "db.t2.micro"
  username       = "${random_string.login.result}"
  password       = "${random_string.password.result}"
  vpc_security_group_ids = ["${aws_security_group.tt-sg.id}"]
  skip_final_snapshot  = true
  publicly_accessible =  true
}