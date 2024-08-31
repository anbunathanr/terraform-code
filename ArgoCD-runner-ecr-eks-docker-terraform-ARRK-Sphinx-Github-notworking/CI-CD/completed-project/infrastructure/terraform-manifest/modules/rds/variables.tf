variable "allocated_storage" {
  description = "The allocated storage for the database instance."
  type        = number
  default     = 20
}

variable "engine_version" {
  description = "The version of the database engine to use."
  type        = string
  default     = "13.4"
}

variable "instance_class" {
  description = "The instance type to use."
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database."
  type        = string
}

variable "db_username" {
  description = "The username for the database."
  type        = string
}

variable "db_password" {
  description = "The password for the database."
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "The name of the parameter group to associate with the database."
  type        = string
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group."
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security group IDs to associate with the database."
  type        = list(string)
}

variable "backup_retention_period" {
  description = "The number of days to retain backups."
  type        = number
  default     = 7
}

variable "multi_az" {
  description = "Whether the database instance is multi-AZ."
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  description = "Whether the database is publicly accessible."
  type        = bool
  default     = false
}