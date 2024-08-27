variable "ami" {
    description = "inserting ami values to main.tf"
    type = string
    default = "ami-0a4408457f9a03be3"
  
}
variable "instance_type" {
    description = "inserting instance type "
    type = string
    default = ""
  
}
variable "key_name" {
    description = "inserting key "
    type = string
    default = ""
  
}