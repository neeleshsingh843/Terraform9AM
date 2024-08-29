resource "aws_instance" "dev" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"
    key_name = "mykp2"
    tags = {
      Name = "myec2"
    }
  
}

resource "aws_s3_bucket" "test" {
    bucket = "neeleshbuck"
    
  
}