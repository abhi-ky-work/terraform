output "ec2_instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.tikitu-ec2-nignx.public_ip
  
}

output "ec2_instance_public_url" {
  description = "The public IP address of the EC2 instance"
  value       = "http://${aws_instance.tikitu-ec2-nignx.public_ip}"
  
}