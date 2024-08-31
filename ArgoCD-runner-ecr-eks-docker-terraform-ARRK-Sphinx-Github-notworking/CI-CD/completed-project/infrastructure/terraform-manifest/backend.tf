terraform {
  backend "s3" {
    bucket         = "terraform-state-arrk-30082024"
    key            = "terraform/terraform.state"
    region         = "eu-central-1"
    dynamodb_table = "eks-terraform-state-arrk"
  }
}

