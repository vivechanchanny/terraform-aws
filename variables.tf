variable "aws_region-1" {
  description = "The AWS region where resources will be provisioned"
  type        = string
  default     = "us-east-1"  # Update with your desired AWS region
}

variable "aws_region-2" {
  description = "The AWS region where resources will be provisioned"
  type        = string
  default     = "us-west-1"  # Update with your desired AWS region
}

variable "aws_profile" {
  description = "The AWS profile name if using multiple profiles in credentials file"
  type        = string
  default     = ""  # If not using profiles, leave it empty
}

variable "assume_role_arn" {
  description = "The IAM role ARN to assume for provisioning resources"
  type        = string
  default     = ""  # Update with the IAM role ARN
}













# variable "ec2_instance_type" {
#   description = "EC2 instance type"
#   type        = string
#   default     = "t2.micro"
# }

# variable "s3_bucket_name" {
#   description = "Name for the S3 bucket"
#   type        = string
# }

# variable "rds_instance_type" {
#   description = "RDS instance type"
#   type        = string
#   default     = "db.t2.micro"
# }

# variable "wordpress_service_port" {
#   description = "Port for the WordPress service"
#   type        = number
#   default     = 80
# }

# variable "alb_dns_name" {
#   description = "DNS name for the Application Load Balancer"
#   type        = string
# }
