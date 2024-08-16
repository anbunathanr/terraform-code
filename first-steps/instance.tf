provider "aws" {
  access_key = "AKIA5YPGKBKDY33KAWOF"
  secret_key = "l0gFxa3nKw1tKKBwEWCIkzvSCL/HaQJjyqIlQjUm"
  region     = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0f29c8402f8cce65c"
  instance_type = "t2.micro"
}

