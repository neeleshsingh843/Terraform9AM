output "publicip" {
  value = aws_instance.name.public_ip
}
output "ami" {
  value = aws_instance.name.ami
}

