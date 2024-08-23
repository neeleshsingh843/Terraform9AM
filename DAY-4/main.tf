resource "aws_s3_bucket" "dev" {
    bucket = "neeleshbuck"
  
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.dev.id
  versioning_configuration {
    status = "Enabled"
  }
}