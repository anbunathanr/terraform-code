output myoutput {
  description = "The public IP address of the AWS instance"
  value       = "${aws_instance.example.public_ip}"
}
