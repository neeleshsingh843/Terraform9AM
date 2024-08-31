module "dev" {
  source = "../DAY-2"
  ami = "ami-0a4408457f9a03be3"
  instance_type = "t2.nano"
  key_name = "mykp2"
}