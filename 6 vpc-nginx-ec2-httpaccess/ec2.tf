resource "aws_instance" "tikitu-ec2-nignx" {
  
    ami           = "ami-042b4708b1d05f512"
    instance_type = "t3.nano"
    subnet_id = aws_subnet.public-subnet.id
    vpc_security_group_ids = [aws_security_group.sg-nginx.id]
    associate_public_ip_address = true # create the instance and assign a public ip address


    user_data = <<-EOF
    #!/bin/bash
    sudo apt-get install nginx -y
    sudo systemctl start nginx
    EOF


    tags = {
        Name = "TikituNginxInstance"
    }
}