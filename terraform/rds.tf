resource "aws_db_instance" "rds" {
  identifier              = "${var.environment}-rds-${var.db_name}"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.db_instance_class
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password 
  allocated_storage       = var.db_allocated_storage
  storage_type            = "gp3"
  db_subnet_group_name    = aws_db_subnet_group.rds_subnets.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]

  skip_final_snapshot     = true
  deletion_protection     = false
  multi_az                = var.multi_az
  backup_retention_period = 7
  port                    = 3306
}
