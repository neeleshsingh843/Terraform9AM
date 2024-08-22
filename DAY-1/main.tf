resource "aws_instance" "name" {
count = 2
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
}