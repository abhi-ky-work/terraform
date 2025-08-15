terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.8.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "eu-north-1" # Default region, can be overridden by variable
}

resource "random_id" "rand_id" {
  byte_length = 8
  
}

resource "aws_s3_bucket" "tikitu_website_bucket" {
  bucket = "tikitu-website-bucket-${random_id.rand_id.hex}" # Unique bucket name using random ID 
#   acl    = "private"
}
resource "aws_s3_bucket_public_access_block" "tikitu_website_bucket_public_access_block" {
  bucket = aws_s3_bucket.tikitu_website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "tikitu_website_bucket_policy" {
  bucket = aws_s3_bucket.tikitu_website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
        {
            Sid = "PublicReadGetObject",
            Effect = "Allow",
            Principal = "*",
            Action = "s3:GetObject",
            Resource = "arn:aws:s3:::${aws_s3_bucket.tikitu_website_bucket.id}/*"
        }
    ]
})
}

resource "aws_s3_bucket_website_configuration" "tikitu_s3_website_configuration" {
  bucket = aws_s3_bucket.tikitu_website_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index_html" {
    bucket = aws_s3_bucket.tikitu_website_bucket.bucket # The name of the bucket to upload the file to
    source = "./index.html"
    key    = "index.html" # The name of the file in the bucket 
    content_type = "text/html"
}
# another block for css file 
output "random_id" {
  description = "A randomly generated ID"
  value       = random_id.rand_id.hex
  
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.tikitu_s3_website_configuration.website_endpoint
}