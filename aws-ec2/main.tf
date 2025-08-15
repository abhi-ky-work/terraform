terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.8.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}

resource "aws_instance" "tikitu" {
  
    ami           = "ami-042b4708b1d05f512" # Example AMI ID, replace with a valid one for your region
    instance_type = "t3.nano"
    
    tags = {
        Name = "TikituInstance"
    }
}

