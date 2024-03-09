variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"  # Update with your desired VPC CIDR block
}

variable "subnet_cidr_block_a" {
  description = "CIDR block for subnet A"
  type        = string
  default     = "10.0.1.0/24"  # Update with your desired subnet CIDR block for subnet A
}

variable "subnet_cidr_block_b" {
  description = "CIDR block for subnet B"
  type        = string
  default     = "10.0.2.0/24"  # Update with your desired subnet CIDR block for subnet B
}

variable "subnet_cidr_block_c" {
  description = "CIDR block for subnet C"
  type        = string
  default     = "10.0.3.0/24"  # Update with your desired subnet CIDR block for subnet C
}

variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default     = "my-vpc"  # Update with your desired VPC name
}

variable "region" {
  description = "AWS region where resources will be provisioned"
  type        = string
}


