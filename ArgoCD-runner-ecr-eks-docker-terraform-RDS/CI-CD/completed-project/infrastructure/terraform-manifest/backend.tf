terraform {
  backend "s3" {
    bucket         = "terraform-state-asjukliu"
    key            = "terraform/terraform.state"
    region         = "eu-central-1"
    dynamodb_table = "eks-terraform-state"
  }
}

