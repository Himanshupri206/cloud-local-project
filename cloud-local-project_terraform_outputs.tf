output "bucket_name" {
  value = aws_s3_bucket.demo_bucket.id
}

output "log_group" {
  value = aws_cloudwatch_log_group.demo.name
}