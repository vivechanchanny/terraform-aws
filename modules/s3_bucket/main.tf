// Define more S3 buckets if needed
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name # Specify a globally unique name for your bucket

  # Additional configurations for your bucket (optional)
  force_destroy = true  # Set to true to allow Terraform to delete the bucket
}