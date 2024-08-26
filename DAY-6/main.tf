resource "aws_instance" "test" {
  ami= "ami-0a4408457f9a03be3"
  instance_type = "t2.micro"
  key_name = "mykp2"

  tags = {
   Name = "test"
  }
}