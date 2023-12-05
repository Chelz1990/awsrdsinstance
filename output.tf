output "db_instance_endpoint" {
  value       = aws_db_instance.dbserver.endpoint
  depends_on = aws_db_instance.ttplaydbserver
}