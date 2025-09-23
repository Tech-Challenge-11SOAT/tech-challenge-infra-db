output "rds_endpoint" {
  value = aws_db_instance.rds.address
}

output "db_port" {
  value = aws_db_instance.rds.port
}