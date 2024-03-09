variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "internal" {
  description = "Whether the load balancer is internal (true) or external (false)"
  type        = bool
  
}

variable "lb_type" {
  description = "Type of the load balancer (application, network)"
  type        = string
}

variable "security_group" {
  description = "Security group ID for the load balancer"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the load balancer will be created"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group for the load balancer"
  type        = string
}

variable "target_group_port" {
  description = "Port for the target group"
  type        = number
}

variable "subnets" {
  description = "List of subnet IDs where the load balancer will be deployed"
  type        = list(string)
}

variable "target_id" {
  description = "ID of the target instance to attach to the target group"
  type        = string
}
