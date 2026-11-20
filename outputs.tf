output "bucket_id" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.example.id
}

output "bucket_arn" {
  description = "The ARN of the S3 bucket"
  value       = aws_s3_bucket.example.arn
}

output "bucket_region" {
  description = "The AWS region of the bucket"
  value       = aws_s3_bucket.example.region
}
