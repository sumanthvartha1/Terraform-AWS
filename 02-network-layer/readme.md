# Terraform Project 2 - Build a Custom AWS Network

## Overview

This project extends the first project by introducing custom networking. Instead of relying on the default AWS VPC, the infrastructure is deployed inside a custom VPC with public and private subnets.

The project demonstrates how networking resources are created and connected using Terraform modules.

---

## Architecture

```
                    Internet
                        │
                Internet Gateway
                        │
                Public Route Table
                        │
        ---------------------------------
        |                               |
        |       VPC (10.0.0.0/16)       |
        |                               |
        |  Public Subnet   Private Subnet
        |   10.0.1.0/24      10.0.2.0/24
        |        │
        |      EC2 Instance
        ---------------------------------
```

---

## Technologies Used

- Terraform
- AWS VPC
- AWS Subnets
- Internet Gateway
- Route Tables
- EC2
- Security Groups

---

## Project Structure

```
terraform-project-2/

├── provider.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
│
└── modules/
    ├── network/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── ec2/
        ├── main.tf
        ├── variables.tf
        ├── outputs.tf
        └── data.tf
```

---

## Infrastructure Created

### Network Module

- VPC
- Public Subnet
- Private Subnet
- Internet Gateway
- Public Route Table
- Route Table Association

### EC2 Module

- Security Group
- SSH Rule
- Application Rule
- Outbound Rule
- EC2 Instance

---

## Prerequisites

- AWS Account
- AWS CLI configured
- Terraform installed
- Existing EC2 Key Pair

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

Clone the repository:

```bash
git clone <repository-url>

cd terraform-project-2
```

---

Initialize Terraform

```bash
terraform init
```

---

Format the configuration

```bash
terraform fmt
```

---

Validate the project

```bash
terraform validate
```

---

Review the execution plan

```bash
terraform plan
```

---

Provision the infrastructure

```bash
terraform apply
```

Confirm with:

```
yes
```

---

View outputs

```bash
terraform output
```

Useful outputs include:

- VPC ID
- Public Subnet ID
- Private Subnet ID
- EC2 Instance ID
- Public IP Address

---

Remove the infrastructure

```bash
terraform destroy
```

---

## Concepts Covered

- Custom VPC
- Public and Private Subnets
- Internet Gateway
- Route Tables
- Route Table Association
- Module-to-Module Communication
- Module Outputs
- Resource Dependencies
- EC2 Deployment in a Custom Network

---

## Learning Outcome

This project helped me understand how AWS networking components work together and how Terraform modules communicate using variables and outputs. It also reinforced the importance of designing reusable infrastructure and organizing Terraform code into independent modules.