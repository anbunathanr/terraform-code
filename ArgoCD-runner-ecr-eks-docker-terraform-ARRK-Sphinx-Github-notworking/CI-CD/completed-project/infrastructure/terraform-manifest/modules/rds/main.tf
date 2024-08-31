resource "aws_db_instance" "this" {
  allocated_storage    = var.allocated_storage
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.parameter_group_name
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  # Optional parameters
  backup_retention_period = var.backup_retention_period
  multi_az                 = var.multi_az
  publicly_accessible      = var.publicly_accessible

  tags = {
    Name = var.db_name
  }

  # Ensure the database is created with a publicly accessible endpoint
  final_snapshot_identifier = "final-snapshot-${var.db_name}"
  skip_final_snapshot        = false

  lifecycle {
    prevent_destroy = true
  }
}

output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "db_port" {
  value = aws_db_instance.this.port
}

output "db_instance_id" {
  value = aws_db_instance.this.id
}
