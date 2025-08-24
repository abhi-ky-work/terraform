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
  region = var.region
}

resource "random_id" "rand_id" {
  byte_length = 8
  
}

resource "aws_s3_bucket" "tikitu_bucket" {
  bucket = "tikitu-bucket-145" # Unique bucket name using random ID 
#   acl    = "private"

#   tags = {
#     Name        = "TikituBucket"
#     Environment = "Production"
#   }
}

# resource "aws_s3_object" "bucket_data" {
#     bucket = aws_s3_bucket.tikitu_bucket.bucket # The name of the bucket to upload the file to
#     key    = "sample.txt" # The name of the file in the bucket 
#     source = "./sample.txt"
# }


# output "random_id" {
#   description = "A randomly generated ID"
#   value       = random_id.rand_id.hex
  
# }