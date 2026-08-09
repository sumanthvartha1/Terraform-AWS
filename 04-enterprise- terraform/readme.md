# Enterprise Terraform Infrastructure on AWS

## Project Overview

This project demonstrates how Terraform is organized and managed in a real-world enterprise environment.

Instead of maintaining a single Terraform configuration for all infrastructure, the project separates environments and uses reusable modules to provide consistency, scalability, and maintainability.

The infrastructure provisions a complete AWS environment including networking, compute, load balancing, and autoscaling components.

---

## Architecture

```text
                    Internet
                        |
                        |
                   Application
                 Load Balancer
                        |
                        |
              -------------------
              |                 |
          EC2 Instance      EC2 Instance
              |                 |
              -------------------
                        |
                  Auto Scaling
                     Group
                        |
                   Private Subnets

------------------------------------------------

VPC
├── Public Subnet AZ1
├── Public Subnet AZ2
├── Private Subnet AZ1
├── Private Subnet AZ2
├── Internet Gateway
├── NAT Gateway
├── Route Tables
└── Security Groups
```

---

## Project Structure

```text
enterpriseterraform/
│
├── environments/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   │
│   ├── staging/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   └── backend.tf
│   │
│   └── prod/
│
├── modules/
│   ├── network/
│   ├── ec2/
│   ├── alb/
│   └── asg/
│
├── providers.tf
└── README.md
```

---

## Infrastructure Components

### Network Module

Creates:

- VPC
- Internet Gateway
- Public Subnets
- Private Subnets
- NAT Gateway
- Route Tables
- Route Table Associations

### Security Module

Creates:

- Application Security Groups
- ALB Security Groups
- Ingress Rules
- Egress Rules

### Load Balancer Module

Creates:

- Application Load Balancer
- Listener
- Target Group

### Compute Module

Creates:

- Launch Template
- EC2 Configuration
- Auto Scaling Group

---

## Environments

The project follows environment isolation.

### Development

Used for:

- Feature testing
- Infrastructure validation
- Initial deployment verification

### Staging

Used for:

- Pre-production testing
- Release validation
- Integration testing

### Production

Used for:

- Live workloads
- Customer traffic
- High availability deployments

Each environment maintains:

- Separate state
- Separate variables
- Separate resources

Example:

```text
payment-dev-vpc
payment-dev-alb

payment-staging-vpc
payment-staging-alb

payment-prod-vpc
payment-prod-alb
```

---

## Remote State Management

Terraform state is stored remotely in Amazon S3.

Features:

- Centralized state storage
- State versioning enabled
- Team collaboration support
- Disaster recovery through state versions

State locking is managed using DynamoDB.

Benefits:

- Prevents simultaneous Terraform executions
- Avoids state corruption
- Ensures safe team operations

---

## Key Terraform Concepts Implemented

### Reusable Modules

Infrastructure components are abstracted into reusable modules.

Benefits:

- Less duplication
- Easier maintenance
- Consistent deployments

---

### Environment Isolation

Every environment has:

- Dedicated configuration
- Dedicated state
- Dedicated resource naming

Benefits:

- Safe deployments
- Reduced risk
- Independent lifecycle management

---

### Infrastructure Naming Standards

Resources follow a consistent naming convention.

Example:

```text
project-environment-resource

payment-dev-vpc
payment-staging-alb
payment-prod-asg
```

Benefits:

- Easy identification
- Better operations visibility
- Cleaner AWS console organization

---

### State Recovery and Versioning

Terraform state versioning was tested and validated.

Scenarios explored:

- State recovery
- State rollback
- State inspection
- Drift understanding

This helped demonstrate how Terraform tracks infrastructure and how state differs from actual cloud resources.

---

## Skills Demonstrated

- Terraform Modules
- Terraform Variables
- Terraform Outputs
- Terraform Remote Backend
- Terraform State Management
- Terraform State Versioning
- Terraform State Recovery
- AWS VPC
- AWS Networking
- AWS Security Groups
- AWS Application Load Balancer
- AWS Auto Scaling Groups
- Infrastructure as Code
- Environment Management
- Production Style Terraform Structure

---

## Commands

Initialize:

```bash
terraform init
```

Validate:

```bash
terraform validate
```

Plan:

```bash
terraform plan
```

Deploy:

```bash
terraform apply
```

Destroy:

```bash
terraform destroy
```

Inspect State:

```bash
terraform state list
terraform show
```

---

## Key Learning Outcome

This project was built to move beyond tutorial-style Terraform and follow patterns commonly used by DevOps teams managing multiple environments.

The focus was not only creating AWS resources, but also learning:

- How infrastructure is organized at scale
- How teams separate environments
- How remote state is managed
- How state locking works
- How Terraform recovers from state issues
- How reusable infrastructure modules are designed

The result is an enterprise-style Terraform codebase capable of managing development, staging, and production environments using a single reusable architecture.
