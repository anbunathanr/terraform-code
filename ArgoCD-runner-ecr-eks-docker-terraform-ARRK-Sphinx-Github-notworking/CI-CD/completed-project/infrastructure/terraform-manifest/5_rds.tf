resource "aws_db_instance" "arrk_rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  instance_class       = "db.t3.micro"
  engine               = "postgres"
  engine_version       = "13.14"
  db_name              = "arrkdatabase" # Corrected from "name" to "db_name"
  username             = "dbadmin"
  password             = "sphinx123#"
  db_subnet_group_name = aws_db_subnet_group.arrk_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  publicly_accessible  = false
  backup_retention_period = 7

  tags = {
    Name = "arrk-rds-instance"
  }
}

resource "aws_db_subnet_group" "arrk_db_subnet_group" {
  name       = "arrk-db-subnet-group"
  subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  tags = {
    Name = "arrk-db-subnet-group"
  }
}

resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.arrk_vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}
