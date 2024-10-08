output "db_subnet_group_id" {
  description = "The db subnet group name"
  value = element(concat(aws_db_subnet_group.db_sub_gr.*.id, tolist([""])), 0)
}

output "db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value = element(concat(aws_db_subnet_group.db_sub_gr.*.arn, tolist([""])), 0)
}

/*
output "db_instance_id" {
  value = "${aws_db_instance.db.id}"
}

output "db_instance_address" {
  value = "${aws_db_instance.db.address}"
}
*/
locals {

  db_instance_address = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.address,  # Use the correct resource reference here
        tolist([""])  # Empty list for fallback
      )
    ),
    0
  )
  
  db_instance_arn = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.arn,  # Use the correct resource reference
        tolist([""])  # Empty list as fallback
      )
    ),
    0
  )
  
  db_instance_availability_zone = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.availability_zone,  # Use the correct resource reference
        tolist([""])  # Empty list as fallback
      )
    ),
    0
  )
  
  db_instance_endpoint = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.endpoint,  # Use the correct resource reference
        tolist([""])  # Empty list for fallback
      )
    ),
    0
  )
  
  db_instance_hosted_zone_id = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.hosted_zone_id,  # Correct resource reference
        tolist([""])  # Empty list for fallback
      )
    ),
    0
  )
  
  db_instance_id = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.id,  # Correct resource reference
        tolist([""])  # Empty list as fallback
      )
    ),
    0
  )
  
  db_instance_resource_id = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.resource_id,  # Correct resource reference
        tolist([""])  # Empty list for fallback
      )
    ),
    0
  )
  
  db_instance_status = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.status,  # Correct resource reference
        tolist([""])  # Empty list for fallback
      )
    ),
    0
  )
  
  db_instance_name = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.id,  # Correct resource reference
        tolist([""])  # Empty list for fallback
      )
    ),
    0
  )
  
  db_instance_username = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.username,  # Correct resource reference
        tolist([""])  # Empty list for fallback
      )
    ),
    0
  )
  
  db_instance_password = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.password,  # Correct resource reference
        tolist([""])  # Empty list for fallback
      )
    ),
    0
  )
  
  db_instance_port = element(
    concat(
      coalescelist(
        aws_db_instance.db.*.port,  # Correct resource reference
        tolist([""])  # Empty list for fallback
      )
    ),
    0
  )
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = "${local.db_instance_address}"
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = "${local.db_instance_arn}"
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = "${local.db_instance_availability_zone}"
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = "${local.db_instance_endpoint}"
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = "${local.db_instance_hosted_zone_id}"
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = "${local.db_instance_id}"
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = "${local.db_instance_resource_id}"
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = "${local.db_instance_status}"
}

output "db_instance_name" {
  description = "The database name"
  value       = "${local.db_instance_name}"
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = "${local.db_instance_username}"
}

output "db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = "${local.db_instance_password}"
}

output "db_instance_port" {
  description = "The database port"
  value       = "${local.db_instance_port}"
}
