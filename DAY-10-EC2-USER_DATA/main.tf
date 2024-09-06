resource "aws_instance" "DEV" {
  ami = "ami-0a4408457f9a03be3"
  instance_type = "t2.micro"
  key_name = "mykp2"
  user_data = file("test.sh")
  tags = {
    Name = "test"
  }
}

resource "aws_internet_gateway" "name" {
  vpc_id = "vpc-0dab69eb80069fa9f"
  tags = {
    Name = "IG1"
  }
}