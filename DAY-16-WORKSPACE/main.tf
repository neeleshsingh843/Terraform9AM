resource "aws_instance" "name" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"
    key_name = "mykp2"
    count = length(var.test)
    tags = {
        Name = var.test[count.index]
    }  
}
variable "test" {
    type = list(string)
    default = [ "1" , "2" , "3" ]
  
}