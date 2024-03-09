resource "aws_security_group" "alb_sg" {
  name        = var.security_group_namealb
  description = "Security group for Application Load Balancer"
  vpc_id      = var.vpc_id
  
  # Define ingress rules to allow inbound traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP access from anywhere
  }

  # Define egress rules to allow outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow outbound traffic to anywhere
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = var.security_group_name_ec2
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id

  # Define ingress rules to allow SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH access from anywhere
  }

  # Define egress rules to allow only port 80 traffic to the ALB security group
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
    # security_groups = [aws_security_group.alb_sg.id]  # Allow traffic only to ALB security group
  }

  # Define egress rule to allow all other outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow outbound traffic to anywhere
  }
}