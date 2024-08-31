module "rds" {
  source = "./modules/rds"  
  subnets             = aws_subnet.private[*].id
  sec_grp_rds         = aws_security_group.rds_sg.id  # Provide the security group ID
  
  identifier        = "${var.identifier}"
  storage_type      = "${var.storage_type}"
  allocated_storage = "${var.allocated_storage}"
  db_engine         = "${var.db_engine}"
  engine_version    = "${var.engine_version}"
  instance_class    = "${var.instance_class}"
  db_username       = "${var.db_username}"
  db_password       = "${var.db_password}"  
  
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids  = aws_subnet.private.*.id  # Ensure you have private subnets defined

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_subnet" "private" {
  count                   = 2
  vpc_id = module.vpc.vpc_id
  cidr_block              = "10.0.${count.index * 2 + 6}.0/24"
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-security-group"
  description = "Security group for RDS instance"
  vpc_id = module.vpc.vpc_id  # Ensure you have a VPC defined

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.eks_sg.id]  # Allow access from EKS security group
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for EKS Nodes
resource "aws_security_group" "eks_sg" {
  name        = "eks-security-group"
  description = "Security group for EKS nodes"
  vpc_id = module.vpc.vpc_id  # Reference to your VPC

  # Allow inbound traffic from within the VPC
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Adjust CIDR block based on your VPC
  }

  # Allow outbound traffic to the internet (if required)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-security-group"
  }
}