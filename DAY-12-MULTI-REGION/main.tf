provider "aws" {
    alias = "mu"
  
}
provider "aws" {
  region = "us-east-1"
  alias = "us"
}

resource "aws_s3_bucket" "BUCK1" {
  bucket = "amchius1"
  provider = aws.us

}
resource "aws_s3_bucket" "mumbaiii" {
  bucket = "amchimumbai"
  provider = aws.mu
}

