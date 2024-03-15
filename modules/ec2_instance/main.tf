resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = var.security_group_ids
  key_name        = var.key_pair_name
  associate_public_ip_address = true


 user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1.12 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

    tags = {
    Name = var.instance_name
  }


  # lifecycle {
  # prevent_destroy = true
  # }
}

  # Add other necessary configurations for your EC2 instance
