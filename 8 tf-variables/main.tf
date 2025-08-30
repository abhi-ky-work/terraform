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
  region = "eu-north-1"

}
locals {
  server_tag = "webserver"
}
resource "aws_instance" "tikitu" {
  
    ami           = "ami-042b4708b1d05f512" # Example AMI ID, replace with a valid one for your region
    instance_type = "t3.nano"
    
    root_block_device {
      delete_on_termination = true
    #   volume_size = var.ec2_root_volume_size
    #   volume_type = var.ec2_root_volume_type
    
    volume_size = var.ec2_root_block_config.vol_size
    volume_type = var.ec2_root_block_config.vol_type

    }


    tags = merge( var.additional_tags ,{
        Name = "tikituInstance"
        Server = local.server_tag
    })
}