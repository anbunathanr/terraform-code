variable "AWS_ACCESS_KEY" {
  default = "AKIA5YPGKBKDY33KAWOF"
}

variable "AWS_SECRET_KEY" {
  default = "l0gFxa3nKw1tKKBwEWCIkzvSCL/HaQJjyqIlQjUm"
}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-0f29c8402f8cce65c"
  }
}

