resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-cdefts"

  tags = {
    Name = "Terraform state"
  }
}

