### Provider
region             = "eu-central-1"
availability_zones = ["eu-central-1a", "eu-central-1b"]
environment  = "staging"


###### ECR
ecr_repo_name = "arrk-app-310824"


###### VPC
vpc_cidr = "10.0.0.0/16"
public_subnet_cidr_blocks = [
  "10.0.1.0/24",
  "10.0.2.0/24",
]
private_subnet_cidr_blocks = [
  "10.0.3.0/24",
  "10.0.4.0/24",
]

##### EKS
cluster_name="ARRK-eks-app"
cluster_version="1.29"
desired_capacity = 2
instance_type = "t3.medium"
max_capacity =5
min_capacity =1

##### RDS
identifier = "terra-db"
storage_type = "gp2"
allocated_storage = "10"
db_engine = "postgres"
engine_version = "14.9"
instance_class = "db.t3.large"
db_username = "root"
db_password = "arrk123$"
###https://docs.amazonaws.cn/en_us/AmazonRDS/latest/AuroraUserGuide/Concepts.DBInstanceClass.SupportAurora.html
###https://docs.aws.amazon.com/AmazonRDS/latest/PostgreSQLReleaseNotes/postgresql-versions.html



