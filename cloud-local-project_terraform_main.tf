resource "aws_s3_bucket" "demo_bucket" {
  bucket = "local-cloud-demo"
  tags = {
    project = "cloud-local-project"
    env     = "local"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.demo_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.demo_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_object" "hello" {
  bucket  = aws_s3_bucket.demo_bucket.id
  key     = "hello.txt"
  content = "Hello Local Cloud!"
}

resource "aws_cloudwatch_log_group" "demo" {
  name              = "/local/demo"
  retention_in_days = 7
}