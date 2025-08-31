variable "aws_instance_type" {
  description = "Type of aws instance for ec2 :"
  validation {
    condition     = var.aws_instance_type == "t2.micro" || var.aws_instance_type == "t3.micro"
    error_message = "Valid input t2.micro or t3.mirco"
  }
}


# variable "ec2_root_volume_size" {
#   description = "EC2 instance volume size :"
#   type = number
#   default = 20
# }

# variable "ec2_root_volume_type" {
#   description = "EC2 instance volume tryp :"
#   type = string
#   default = "gp2"
# }

variable "ec2_root_block_config" {
  type = object({
    vol_size = number
    vol_type = string
  })

  default = {
    vol_size = 20
    vol_type = "gp2"
  }

}


variable "additional_tags" {
  type    = map(string)
  default = {}
}