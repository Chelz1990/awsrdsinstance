# get database endpoint
output "db_instance_endpoint" {
  value       = aws_db_instance.ttplaydbserver.endpoint
  depends_on = [
    aws_db_instance.ttplaydbserver
  ]
}

output "db_password" {
  value = aws_db_instance.ttplaydbserver.password
  sensitive = true
}