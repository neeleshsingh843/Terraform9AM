terraform {
  backend "s3" {
    bucket = "neeleshbuck"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}