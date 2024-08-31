data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["PUB-SUB"]
  }
}
data "aws_vpc" "TEST" {
  filter {
    name = "tag:Name"
    values = ["TEST"]
  }
}

resource "aws_instance" "dev" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"
    key_name = "mykp2"
    tags = {
      Name = "myec2"
    }

    subnet_id = "subnet-02adcd96d80829ee6"
    
}