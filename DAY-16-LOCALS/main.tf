locals {
  region = "ap-south-1"
  environment = "dev"
  instance_type = "t2.micro"
}

resource "aws_instance" "example" {
  ami           = "ami-0a4408457f9a03be3" # Amazon Linux 2 AMI
  instance_type = local.instance_type

  tags = {
    Name        = "ExampleInstance"
    Environment = local.environment
  }
}