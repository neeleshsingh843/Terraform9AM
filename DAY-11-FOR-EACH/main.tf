resource "aws_instance" "name" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"
    key_name = "mykp2"
    for_each = toset(var.test)
    tags = {
        Name = each.value
    }  
}
variable "test" {
    type = list(string)
    default = [ "1" ,  "3" ]
  
}