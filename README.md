# AWS Infrastructure Automation with Terraform and CloudFormation

## Final Individual Project

**Student:** Dwarkeshkumar Nasit  
**Course:** PROG 8870 - Cloud Architectures and Infrastructure as Code  
**Instructor:** Vikas Vattikonda
**Date:** August 13, 2025  

---

## Project Overview

This project demonstrates the implementation of **Infrastructure as Code (IaC)** using two industry-standard tools: **Terraform** and **AWS CloudFormation**. The goal is to create a scalable, multi-service AWS infrastructure that showcases best practices in cloud automation, security, and resource management.

## Infrastructure Components Deployed

### **Terraform Resources (Successfully Deployed):**
- **4 S3 Buckets** with versioning and public access blocking
- **Custom VPC** with CIDR block 10.0.0.0/16
- **Public Subnet** (10.0.1.0/24) in us-east-1a
- **2 Private Subnets** (10.0.2.0/24, 10.0.3.0/24) in us-east-1a and us-east-1b
- **Internet Gateway** for internet connectivity
- **Route Tables** for network routing
- **EC2 Instance** (t2.micro) with Amazon Linux 2 AMI
- **RDS MySQL Database** (db.t3.micro) with MySQL 8.0.37
- **Security Groups** for EC2 (SSH access) and RDS (MySQL access)
- **DB Subnet Group** for RDS deployment

### **CloudFormation Stacks (Successfully Deployed):**
- **S3 Stack**: 3 additional private S3 buckets with versioning
- **EC2 Stack**: Additional EC2 instance with custom VPC and networking

## Project Implementation Details

### **Terraform Configuration:**
- **Provider**: AWS (us-east-1 region)
- **Backend**: Local state storage (as per requirements)
- **Variables**: Dynamic configuration for all resource parameters
- **Outputs**: Resource IDs, IPs, endpoints, and ARNs

### **Key Terraform Files:**
- `main.tf`: Core infrastructure configuration
- `variables.tf`: Input variable definitions
- `outputs.tf`: Output value definitions
- `backend.tf`: Local backend configuration
- `terraform.tfvars.example`: Example variable values

### **CloudFormation Templates:**
- `cloudformation-s3.yaml`: S3 bucket creation with public access blocking
- `cloudformation-ec2.yaml`: EC2 instance with VPC and networking

## Deployment Process Implemented

### **1. AWS Setup:**
- Created new IAM user (`final-project-user`) with appropriate permissions
- Configured AWS CLI with access keys
- Set up proper credentials for programmatic access

### **2. Terraform Deployment:**
```bash
# Set database password
export TF_VAR_db_password="FinalProject2024!"

# Initialize and deploy
terraform init
terraform plan
terraform apply
```

### **3. CloudFormation Deployment:**
```bash
# Deploy S3 stack
aws cloudformation create-stack \
  --stack-name final-project-s3 \
  --template-body file://cloudformation-s3.yaml \
  --parameters ParameterKey=ProjectName,ParameterValue=prog8870-final ParameterKey=Environment,ParameterValue=dev

# Deploy EC2 stack
aws cloudformation create-stack \
  --stack-name final-project-ec2 \
  --template-body file://cloudformation-ec2.yaml \
  --parameters ParameterKey=KeyPairName,ParameterValue=prog8870-key ParameterKey=InstanceType,ParameterValue=t2.micro
```

### **4. Key Pair Creation:**
```bash
aws ec2 create-key-pair --key-name prog8870-key --query 'KeyMaterial' --output text > prog8870-key.pem
```

## Current Infrastructure Status

### **Successfully Deployed Resources:**
- **VPC ID**: `vpc-0e564a35ff801ed42`
- **EC2 Instance ID**: `i-05d483b228a9c59a3`
- **EC2 Public IP**: `54.161.144.79`
- **EC2 Public DNS**: `ec2-54-161-144-79.compute-1.amazonaws.com`
- **RDS Instance ID**: `db-UI247WBXQ2KVAJI3VNCGD4VCXQ`
- **RDS Endpoint**: `prog8870-final-rds.cwvwyeucohyc.us-east-1.rds.amazonaws.com:3306`
- **S3 Buckets**: 7 total (4 Terraform + 3 CloudFormation)
- **Security Groups**: EC2 (sg-0b7e3309c85501016) and RDS (sg-03bc7219cd98aebc2)

### **CloudFormation Stack Status:**
- **S3 Stack**: `final-project-s3` `CREATE_COMPLETE`
- **EC2 Stack**: `final-project-ec2` `CREATE_COMPLETE`

## Learning Outcomes Demonstrated

### **Technical Skills:**
- **Infrastructure as Code** implementation with Terraform and CloudFormation
- **AWS service integration** (EC2, S3, RDS, VPC, Security Groups)
- **Network architecture** design with public/private subnets
- **Security configuration** with least-privilege access
- **State management** and resource tracking

### **Best Practices:**
- **Version control** for infrastructure code
- **Dynamic configuration** using variables and parameters
- **Security-first** approach with private subnets and access controls
- **Modular design** for reusability and maintainability
- **Documentation** and code organization

## Project Files

### **Core Infrastructure Files:**
- `main.tf` - Main Terraform configuration
- `variables.tf` - Variable definitions
- `outputs.tf` - Output values
- `backend.tf` - Backend configuration
- `terraform.tfvars.example` - Example variable values

### **CloudFormation Templates:**
- `cloudformation-s3.yaml` - S3 bucket template
- `cloudformation-ec2.yaml` - EC2 instance template

## Infrastructure Verification Commands

### **Terraform Status:**
```bash
terraform show
terraform output
terraform state list
```

### **AWS Resources:**
```bash
# S3 buckets
aws s3 ls

# EC2 instances
aws ec2 describe-instances --filters "Name=tag:Project,Values=prog8870-final"

# RDS databases
aws rds describe-db-instances

# CloudFormation stacks
aws cloudformation list-stacks
```

## Project Achievements

This project successfully demonstrates:
1. **Complete AWS infrastructure** deployment using IaC
2. **Multi-tool proficiency** (Terraform + CloudFormation)
3. **Real-world infrastructure** patterns and practices
4. **Security best practices** implementation
5. **Professional documentation** and code organization

---

