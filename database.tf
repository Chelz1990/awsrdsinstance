resource "mysql_database" "tt-db" {
  name = "3tier-aws-mysql-db"
}

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

resource "aws_db_instance" "mysql-db-server" {
  engine         = "mysql"
  engine_version = "5.6.17"
  instance_class = "db.t1.micro"
  username       = "${random_string.login.result}"
  password       = "${random_string.password.result}"
}

#provider "mysql" {
#  endpoint = ""
#  username = "${random_string.login.result}"
#  password = "${random_string.password.result}"
#}