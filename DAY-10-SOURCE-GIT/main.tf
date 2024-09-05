provider "aws" {
  
}


module "git" {
    source = "github.com/neeleshsingh843/Terraform9AM/DAY-2"
    ami = var.ami
    instance_type = var.type
    key_name = "mykp2"
}