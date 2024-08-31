output "subnets" {
  #value = ["${aws_subnet.subnet.*.id}"]
  value = aws_subnet.subnet.*.id
}
