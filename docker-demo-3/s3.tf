resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-asjukliu"

  tags = {
    Name = "Terraform state"
  }
}

