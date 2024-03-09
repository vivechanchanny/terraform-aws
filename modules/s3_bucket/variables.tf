variable "bucket_name" {
  description = "The name for the S3 bucket"
  type        = string
}

variable "acl" {
  description = "The access control list for the S3 bucket"
  type        = string
  default     = "private"
}

variable "force_destroy" {
  description = "Set to true to allow Terraform to delete the S3 bucket"
  type        = bool
  default     = false
}

