

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# not using aws configure key for security resons (can not expose these keys)
provider "aws" {
 alias      = "region1" 
 region = var.aws_region-1
 access_key = ""
 secret_key = ""
# Optionally, you can specify other provider settings here
}

# not using aws configure key for security resons (can not expose these keys)
provider "aws" {
 alias      = "region2"
 region = var.aws_region-2
 access_key = ""
 secret_key = ""
# Optionally, you can specify other provider settings here
}


# provider "aws" {
#   region = var.aws_region
#   profile = var.aws_profile  # Optional: Use a specific profile if provided
#   # Optionally, you can specify other provider settings here

#   # Specify the IAM role ARN to assume
#   assume_role {
#     role_arn = var.assume_role_arn
#   }
# }
