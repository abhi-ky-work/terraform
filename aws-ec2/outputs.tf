output "aws_instance_public_ip" {
  description = "The ID of the AWS EC2 instance"
  value       = aws_instance.tikitu.public_ip
  
}