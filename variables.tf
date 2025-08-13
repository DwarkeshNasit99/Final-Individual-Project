# Variables definition for AWS Infrastructure Terraform configuration

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "prog8870-final"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "availability_zone" {
  description = "Availability zone for public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "availability_zones" {
  description = "Availability zones for private subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ec2_volume_size" {
  description = "EC2 root volume size in GB"
  type        = number
  default     = 8
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "prog8870-key"
}

variable "rds_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "Name of the RDS database"
  type        = string
  default     = "prog8870db"
}

variable "db_username" {
  description = "Username for RDS database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Password for RDS database"
  type        = string
  sensitive   = true
}
