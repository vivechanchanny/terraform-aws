variable "security_group_namealb" {
  description = "Name for the ALB security group"
  type        = string
  default     = "ALB-SG"
}

variable "security_group_name_ec2" {
  description = "Name for the EC2 security group"
  type        = string
  default     = "EC2-SG"
}

variable "vpc_id" {
  description = "ID of the VPC to associate the security groups with"
  type        = string
}

variable "aws_region" {
  description = "The AWS region where resources will be provisioned"
  type        = string
  default     = "us-east-1"  # Update with your desired default AWS region
}

// Define more variables as needed