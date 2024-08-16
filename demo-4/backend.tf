terraform {
  backend "s3" {
    bucket = "terraform-state-cdefts"
	region  = "eu-west-1"
	key = "terraform/demo4"	
  }
}