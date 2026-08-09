# 🚀 Production-Ready AWS Infrastructure with Terraform

## Overview

This project provisions a highly available AWS infrastructure using Terraform by following a modular and production-oriented approach.

The infrastructure is designed to simulate how a DevOps engineer would provision cloud resources in a real-world environment. Instead of deploying a single EC2 instance, the project focuses on building a scalable architecture with private application servers, an Application Load Balancer, and an Auto Scaling Group.

The codebase is organized into reusable Terraform modules, making it easier to maintain, extend, and reuse across different environments.

---

## Architecture

```
                    Internet
                        │
                        ▼
                Internet Gateway
                        │
        ┌───────────────┴───────────────┐
        ▼                               ▼
 Public Subnet (AZ-1)            Public Subnet (AZ-2)
        │                               │
        │                               │
   NAT Gateway                 Application Load Balancer
   Elastic IP                          │
        │                              ▼
        └──────────────► Target Group ◄──────────────┐
                                                     │
                                Auto Scaling Group
                               ┌─────────┴─────────┐
                               ▼                   ▼
                     Private EC2 (AZ-1)   Private EC2 (AZ-2)
```

---

# Project Highlights

- Designed a Multi-AZ VPC architecture
- Deployed public and private subnets
- Configured Internet Gateway and NAT Gateway
- Placed application servers in private subnets
- Implemented Application Load Balancer
- Configured Target Groups and Health Checks
- Used Launch Templates for EC2 configuration
- Implemented Auto Scaling Group for high availability
- Created reusable Terraform modules
- Followed Infrastructure as Code (IaC) best practices

---

# AWS Services Used

- Amazon VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- Route Tables
- Security Groups
- EC2 Launch Templates
- Auto Scaling Groups
- Application Load Balancer (ALB)
- Target Groups

---

# Project Structure

```
Day4/

├── provider.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
│
└── modules
    ├── network
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── ec2
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── alb
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── autoscaling
        ├── data.tf
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

# Module Responsibilities

## Network Module

Responsible for provisioning the complete networking layer.

Resources created:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- Elastic IP
- NAT Gateway
- Public Route Table
- Private Route Table
- Route Table Associations

Outputs:

- VPC ID
- Public Subnet IDs
- Private Subnet IDs

---

## EC2 Module

This module only manages the Security Group used by the application servers.

Resources created:

- Security Group
- Ingress Rules
- Egress Rule

Outputs:

- Security Group ID

---

## ALB Module

Responsible for exposing the application to the internet.

Resources created:

- Application Load Balancer
- ALB Security Group
- Target Group
- HTTP Listener

Outputs:

- Target Group ARN
- ALB DNS Name

---

## Auto Scaling Module

Responsible for managing the lifecycle of EC2 instances.

Resources created:

- Launch Template
- Auto Scaling Group

Configuration:

- Desired Capacity = 2
- Minimum Capacity = 2
- Maximum Capacity = 4

---

# Request Flow

```
Client

↓

Application Load Balancer

↓

Listener (Port 80)

↓

Target Group

↓

Healthy EC2 Instance

↓

Application Response
```

---

# Outbound Internet Flow

Private EC2 instances do not have public IP addresses.

When an instance needs internet access:

```
Private EC2

↓

Private Route Table

↓

NAT Gateway

↓

Elastic IP

↓

Internet Gateway

↓

Internet
```

This allows outbound internet connectivity while keeping the application servers private.

---

# How to Deploy

## 1. Clone the repository

```bash
git clone <repository-url>
cd Day4
```

---

## 2. Configure AWS Credentials

```bash
aws configure
```

Provide:

- Access Key
- Secret Key
- Region

---

## 3. Initialize Terraform

```bash
terraform init
```

---

## 4. Format the configuration

```bash
terraform fmt
```

---

## 5. Validate the configuration

```bash
terraform validate
```

---

## 6. Review the execution plan

```bash
terraform plan
```

---

## 7. Deploy the infrastructure

```bash
terraform apply
```

Type:

```
yes
```

when prompted.

---

## 8. Verify Resources

After deployment, verify the following in the AWS Console:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- Route Tables
- Security Groups
- Launch Template
- Auto Scaling Group
- EC2 Instances
- Application Load Balancer
- Target Group

---

## 9. Destroy Infrastructure

To avoid unnecessary AWS charges:

```bash
terraform destroy
```

---

# Key Concepts Demonstrated

- Infrastructure as Code (IaC)
- Modular Terraform Design
- High Availability
- Private Networking
- NAT Gateway Architecture
- Load Balancing
- Health Checks
- Auto Scaling
- Launch Templates
- Module Inputs and Outputs
- Resource Dependencies
- Reusable Infrastructure Components

---

# What I Learned

This project helped me move beyond provisioning individual AWS resources and understand how production infrastructure is designed.

Some of the biggest takeaways were:

- Breaking infrastructure into reusable modules
- Passing information between modules using variables and outputs
- Designing private networking with NAT Gateways
- Understanding the relationship between Launch Templates and Auto Scaling Groups
- Separating responsibilities between networking, security, load balancing, and compute
- Building infrastructure that is scalable and easier to maintain

---

# Future Improvements

Planned enhancements include:

- Remote Terraform State (S3)
- DynamoDB State Locking
- Multi-environment setup (Dev, Stage, Prod)
- IAM Roles for EC2
- User Data for automated application deployment
- CloudWatch Monitoring
- Auto Scaling Policies
- Terraform Remote Backend
- CI/CD pipeline for Terraform deployments

---

# Author

**Sumanth Vartha**

Aspiring DevOps Engineer focused on building production-ready cloud infrastructure using AWS, Terraform, Docker, Kubernetes, and CI/CD practices.