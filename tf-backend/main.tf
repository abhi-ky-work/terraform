terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.8.0"
    }
  }
  backend "s3" {
    bucket         = "tikitu-bucket-145"
    key            = "tf-backend/main.tf"
    region         = "eu-north-1"
    # dynamodb_table = "tikitu-terraform-lock"
    
  }
}

provider "aws" {
  # Configuration options
  region = "eu-north-1" # Default region, can be overridden by variable
}

resource "aws_instance" "tikitu" {
  
    ami           = "ami-042b4708b1d05f512" # Example AMI ID, replace with a valid one for your region
    instance_type = "t3.nano"
    
    tags = {
        Name = "TikituInstance"
    }
}

