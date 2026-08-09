# Terraform Project 1 - Deploy an EC2 Instance on AWS

## Overview

This project provisions a basic AWS infrastructure using Terraform. The infrastructure includes an EC2 instance, a Security Group, and supporting configurations organized using Terraform modules.

The primary goal of this project is to understand the fundamentals of Infrastructure as Code (IaC), Terraform project structure, reusable modules, variables, outputs, and AWS resource provisioning.

---

## Architecture

```
Terraform
    │
    ▼
AWS
├── Security Group
│   ├── SSH (22)
│   └── Application Port (8080)
│
└── EC2 Instance
```

---

## Technologies Used

- Terraform
- AWS EC2
- AWS Security Groups
- AWS Provider
- Ubuntu (WSL)

---

## Project Structure

```
terraform-project-1/

├── provider.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
│
└── modules/
    └── ec2/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        └── data.tf
```

---

## What This Project Creates

- Latest Amazon Linux AMI
- Security Group
- SSH access on port 22
- Application access on port 8080
- EC2 Instance
- Resource tags
- Useful Terraform outputs

---

## Prerequisites

Before running this project, make sure you have:

- AWS Account
- IAM User with programmatic access
- AWS CLI installed
- Terraform installed
- Existing EC2 Key Pair
- AWS credentials configured

Verify installation:

```bash
terraform version
aws --version
```

Configure AWS CLI:

```bash
aws configure
```

---

## How to Run

### Clone the repository

```bash
git clone <repository-url>

cd terraform-project-1
```

---

### Initialize Terraform

```bash
terraform init
```

Downloads the required AWS provider.

---

### Format the code

```bash
terraform fmt
```

---

### Validate the configuration

```bash
terraform validate
```

---

### Review the execution plan

```bash
terraform plan
```

---

### Create the infrastructure

```bash
terraform apply
```

Type:

```
yes
```

when prompted.

---

### View Outputs

```bash
terraform output
```

---

### Destroy the Infrastructure

```bash
terraform destroy
```

---

## Key Concepts Covered

- Terraform Providers
- Variables
- terraform.tfvars
- Data Sources
- Security Groups
- EC2
- Outputs
- Modules
- Tags
- Terraform State
- Plan and Apply workflow

---

## Learning Outcome

After completing this project, I gained hands-on experience with:

- Writing reusable Terraform modules
- Provisioning AWS infrastructure
- Organizing Terraform projects
- Understanding module inputs and outputs
- Working with Terraform state
- Debugging common Terraform and AWS errors