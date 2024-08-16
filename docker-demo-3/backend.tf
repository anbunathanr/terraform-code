terraform {
  backend "s3" {
    bucket = "terraform-state-cdefts"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}