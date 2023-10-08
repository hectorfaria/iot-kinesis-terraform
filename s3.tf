resource "aws_s3_bucket" "data_bucket" {
  bucket = "kinesis-data-najdorf"
}

resource "aws_s3_bucket_acl" "demo_bucket_acl" {
  bucket = aws_s3_bucket.data_bucket.id
  acl    = "private"
}
