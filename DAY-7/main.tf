resource "aws_instance" "test" {
  ami = "ami-02b49a24cfb95941c"
  instance_type = "t2.micro"
  key_name = "mykp2"
  
}