# Launch Instance 
resource "aws_instance" "dev" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"
    key_name = "mykp2"
    subnet_id = aws_subnet.public.id
    vpc_security_group_ids = [aws_security_group.cust_sg.id]
    tags = {
      Name = "myec2"
    }

}