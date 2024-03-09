# Declare modules

module "vpc_us_east_1" {
  source = "./modules/vpc"
  providers = {
    aws = aws.region1
  }
  vpc_cidr_block     = "10.0.0.0/16"
  subnet_cidr_block_a = "10.0.1.0/24"
  subnet_cidr_block_b = "10.0.2.0/24"
  vpc_name           = "my-vpc-us-east-1"
  region              = "us-east-1"
}

module "vpc_us_west_1" {
  source = "./modules/vpc"
  providers = {
    aws = aws.region2
  }
  vpc_cidr_block     = "10.1.0.0/16"
  subnet_cidr_block_a = "10.1.1.0/24"
  subnet_cidr_block_b = "10.1.2.0/24"
  vpc_name           = "my-vpc-us-west-1"
  region =  "us-west-1"
}

module "security_groups_east" {
  vpc_id = module.vpc_us_east_1.vpc_id
  source = "./modules/security_groups"
  providers = {
    aws = aws.region1
  }
  aws_region = "us-east-1"
}

module "security_groups_west" {
  vpc_id = module.vpc_us_west_1.vpc_id
  source = "./modules/security_groups"
  providers = {
    aws = aws.region2
  }
  aws_region = "us-west-1"
}

module "s3_bucket" {
  source = "./modules/s3_bucket"  # Specify the path to your S3 module directory

  # Pass any required input variables to the module
  bucket_name = "fathershops-vivechan"
  acl         = "private"
  force_destroy = true
}

module "ec2_instance_us_east_1" {
  source = "./modules/ec2_instance"
  providers = {
    aws = aws.region1
  }
  key_pair_name = "ChinnuAWS"
  ami_id        = "ami-0fe4bd75332a821e8"# Replace with your desired AMI ID
  instance_type = "t2.micro"            # Replace with your desired instance type
  instance_name = "wordpress-instance-east"   
  subnet_id     = module.vpc_us_east_1.subnet_a_id  # Use the subnet ID from the VPC module
  security_group_ids = [module.security_groups_east.ec2_sg_id]  # Use the EC2 security group ID from the security group module

  
}

module "ec2_instance_us_west_1" {
  source = "./modules/ec2_instance"
  providers = {
    aws = aws.region2
  }
  key_pair_name = "Channy-vive"
  ami_id        = "ami-0a936a73bc4ebdebd" # Replace with your desired AMI ID
  instance_name = "wordpress-instance-west"   
  instance_type = "t2.micro"            # Replace with your desired instance type
  subnet_id     = module.vpc_us_west_1.subnet_a_id  # Use the subnet ID from the VPC module
  security_group_ids = [module.security_groups_west.ec2_sg_id]  # Use the EC2 security group ID from the security group module
}


module "alb_dns_us_east_1" {
  source = "./modules/alb_dns"
  
  alb_name            = "alb-us-east-1"
  internal            = false
  lb_type             = "application"
  security_group      = module.security_groups_east.alb_sg_id
  vpc_id              = module.vpc_us_east_1.vpc_id
  target_group_name   = "target-group-us-east-1"
  target_group_port   = 80
  subnets             = [module.vpc_us_east_1.subnet_a_id, module.vpc_us_east_1.subnet_b_id]
  target_id           = module.ec2_instance_us_east_1.instance_id
}

# module "alb_dns_us_west_1" {
#   source = "./modules/alb_dns"
  
#   alb_name            = "alb-us-west-1"
#   internal            = false
#   lb_type             = "application"
#   security_group      = module.security_groups_west.alb_sg_id
#   vpc_id              = module.vpc_us_west_1.vpc_id
#   target_group_name   = "target-group-us-west-1"
#   target_group_port   = 80
#   subnets             = [module.vpc_us_west_1.subnet_a_id, module.vpc_us_west_1.subnet_b_id]
#   target_id           = module.ec2_instance_us_west_1.instance_id
# }

