# Terraform Project 3 - Highly Available Web Application with AWS Application Load Balancer

## Overview

This project provisions a highly available AWS infrastructure using Terraform. It extends the previous networking project by introducing an **Application Load Balancer (ALB)** and deploying multiple EC2 instances across different Availability Zones.

The infrastructure is designed using reusable Terraform modules and follows a modular approach similar to real-world production environments.

---

## Architecture

```
                    Internet
                        │
                        ▼
          Application Load Balancer
                (Public ALB)
                        │
                 HTTP Listener (80)
                        │
                  Target Group
                 ┌─────────────┐
                 │             │
                 ▼             ▼
             EC2 Instance 1  EC2 Instance 2
           Public Subnet A  Public Subnet B
                 │             │
          -----------------------------
          |        Custom VPC          |
          -----------------------------
```

---

## Project Structure

```
terraform-project/
│
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
├── outputs.tf
│
└── modules
    ├── network
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── ec2
    │   ├── data.tf
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── alb
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## AWS Resources Created

### Networking

- Custom VPC
- Internet Gateway
- Public Route Table
- Public Route Table Associations
- Public Subnet (AZ-1)
- Public Subnet (AZ-2)
- Private Subnet

### Compute

- 2 EC2 Instances
- EC2 Security Group

### Load Balancing

- Application Load Balancer
- ALB Security Group
- Target Group
- HTTP Listener
- Target Group Attachments

---

## Modules

### Network Module

Responsible for creating the networking infrastructure.

Creates:

- VPC
- Public Subnets
- Private Subnet
- Internet Gateway
- Route Table
- Route Table Associations

Outputs:

- VPC ID
- Public Subnet IDs
- Private Subnet ID

---

### EC2 Module

Responsible for provisioning the application servers.

Creates:

- Security Group
- Two EC2 Instances using Terraform `count`

Outputs:

- Instance IDs
- Public IP Addresses
- Security Group ID

---

### ALB Module

Responsible for distributing incoming traffic.

Creates:

- ALB Security Group
- Application Load Balancer
- Target Group
- Listener
- Target Group Attachments

Outputs:

- ALB DNS Name

---

## Request Flow

```
User
 │
 ▼
Internet
 │
 ▼
Application Load Balancer
 │
 ▼
HTTP Listener
 │
 ▼
Target Group
 │
 ├─────────────┐
 ▼             ▼
EC2-1       EC2-2
 │             │
Application   Application
```

---

## Key Terraform Concepts Used

- Modules
- Variables
- Outputs
- Data Sources
- Count Meta Argument
- Security Groups
- Resource Dependencies
- Module Outputs
- Cross Module Communication

---

## Prerequisites

- AWS Account
- AWS CLI configured
- Terraform v1.15+
- AWS Provider v6+
- Existing EC2 Key Pair

---

## Configure Variables

Update `terraform.tfvars`.

```hcl
aws_region = "ap-south-2"

vpc_cidr = "10.0.0.0/16"

public_subnet1_cidr = "10.0.1.0/24"
public_subnet2_cidr = "10.0.2.0/24"

private_subnet_cidr = "10.0.3.0/24"

instance_name = "payment-api"

instance_type = "t3.small"

key_name = "your-keypair"

project_name = "PaymentAPI"

environment = "Development"

owner = "Your Name"
```

---

## Deployment Steps

### 1. Clone Repository

```bash
git clone <repository-url>

cd terraform-project
```

---

### 2. Initialize Terraform

```bash
terraform init
```

---

### 3. Format Terraform Files

```bash
terraform fmt
```

---

### 4. Validate Configuration

```bash
terraform validate
```

---

### 5. Review Execution Plan

```bash
terraform plan
```

---

### 6. Provision Infrastructure

```bash
terraform apply
```

Type:

```
yes
```

---

### 7. View Outputs

```bash
terraform output
```

Example:

```
alb_dns_name

instance_ids

instance_public_ips

vpc_id

public_subnet_ids
```

---

## Verify in AWS Console

After deployment, verify the following resources:

### VPC

- Custom VPC

### Subnets

- Public Subnet AZ-1
- Public Subnet AZ-2
- Private Subnet

### EC2

- Two Running EC2 Instances

### Security Groups

- payment-sg
- payment-alb-sg

### Load Balancer

- Application Load Balancer
- HTTP Listener
- Target Group
- Healthy Targets

---

## Destroy Infrastructure

To avoid unnecessary AWS charges:

```bash
terraform destroy
```

---

## Learning Outcomes

By completing this project, I learned:

- Designing reusable Terraform modules
- Passing data between modules using outputs
- Using Terraform `count` to create multiple resources
- Building a custom VPC with multiple subnets
- Deploying EC2 instances across multiple Availability Zones
- Configuring an Application Load Balancer
- Creating Target Groups and Listeners
- Understanding end-to-end request flow
- Organizing Terraform code using production-style project structure

---

## Future Improvements

- Move EC2 instances to private subnets
- Introduce NAT Gateway
- Implement Auto Scaling Group
- Add Launch Templates
- Configure HTTPS using ACM
- Route53 DNS Integration
- Remote State using S3
- State Locking using DynamoDB

---

## Author

**Sumanth**

This project is part of my hands-on Terraform learning journey, where I build production-style AWS infrastructure from scratch while following Infrastructure as Code (IaC) best practices.