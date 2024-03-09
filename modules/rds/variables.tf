variable "rds_identifier" {
  description = "Identifier for the RDS instance"
  type        = string
}

variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
}

variable "storage_type" {
  description = "The type of storage (e.g., gp2, io1, standard)"
  type        = string
}

variable "engine" {
  description = "The name of the database engine to be used"
  type        = string
}

variable "engine_version" {
  description = "The version number of the database engine to be used"
  type        = string
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "username" {
  description = "The master username for the RDS instance"
  type        = string
}

variable "password" {
  description = "The master password for the RDS instance"
  type        = string
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
}

// Define more variables as needed
