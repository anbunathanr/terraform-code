terraform {
  backend "s3" {
    bucket = "terraform-state-arrk-30082024"
    key    = "tfstate"
    region = "eu-central-1"
  }
}
