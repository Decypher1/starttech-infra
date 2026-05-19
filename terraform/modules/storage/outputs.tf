output "ecr_repository_url" {
  value = aws_ecr_repository.backend_repo.repository_url
}
output "frontend_bucket_name" {
  value = aws_s3_bucket.frontend_bucket.bucket
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.frontend_cdn.id
}