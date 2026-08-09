# Terraform Infrastructure Engineering Portfolio

## Overview

This repository documents my hands-on journey from foundational Terraform concepts to building reusable, production-style infrastructure using industry-standard practices.

The focus of this repository is not simply learning Terraform syntax. The goal was to understand how infrastructure is designed, modularized, versioned, secured, and managed in real-world cloud environments.

Throughout these projects, I progressively moved from provisioning individual AWS resources to designing reusable infrastructure modules, implementing environment separation, remote state management, and enterprise-grade Terraform repository structures.

---

## What This Repository Covers

### Project 1 – Terraform Fundamentals

Built and managed AWS resources using Terraform while learning:

- Providers
- Resources
- Variables
- Outputs
- State management
- Terraform workflow

**Key Outcome**

Understanding how Terraform converts infrastructure code into actual cloud resources.

---

### Project 2 – Modular Terraform

Refactored infrastructure into reusable modules.

Built:

- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables

**Key Outcome**

Understanding module design and infrastructure reusability.

---

### Project 3 – Application Infrastructure

Built a highly available AWS architecture.

Components:

- VPC
- Multi-AZ Networking
- Security Groups
- Application Load Balancer
- Target Groups
- Listeners
- Auto Scaling Group
- Launch Templates

**Key Outcome**

Understanding how production applications are exposed and scaled.

---

### Project 4 – Production Style Architecture

Designed a complete infrastructure stack using modular Terraform.

Components:

- Networking
- Compute
- Security
- Load Balancing
- Auto Scaling

**Key Outcome**

Building infrastructure similar to what platform and cloud teams manage in real environments.

---

### Project 5 – Enterprise Terraform

Implemented enterprise-level Terraform practices.

Features:

- Remote State Storage (S3)
- State Locking (DynamoDB)
- Environment Separation
- Reusable Modules
- Backend Configuration
- Version Constraints
- Team Collaboration Structure

Environments:

- Development
- Staging
- Production

**Key Outcome**

Understanding how Terraform is operated within engineering teams rather than individual machines.

---

## Skills Demonstrated

### Infrastructure as Code

- Terraform
- HCL
- State Management
- Module Development
- Remote Backends

### AWS

- VPC
- Subnets
- Route Tables
- Internet Gateway
- NAT Gateway
- Security Groups
- EC2
- Launch Templates
- Auto Scaling Groups
- Application Load Balancers
- S3
- DynamoDB

### DevOps Practices

- Infrastructure Modularization
- Environment Management
- Version Control
- State Locking
- Reusable Infrastructure Patterns
- Production Architecture Design

---

## Repository Structure

```text
terraform/
│
├── 01-basic-ec2/
├── 02-network-layer/
├── 03-load-balanced-architecture/
├── 04-enterprise-terraform/
├── 05-production-architecture/
│
├── README.md
└── .gitignore
```

Each project contains its own detailed README explaining:

- Business requirement
- Architecture decisions
- Terraform implementation
- Commands used
- Lessons learned

---

## Engineering Principles Followed

Throughout these projects I intentionally focused on:

- Reusability over duplication
- Modular design
- Environment isolation
- Infrastructure consistency
- Version control
- Production-oriented architecture
- Clear naming conventions
- Maintainable Terraform code

---

## Lessons Learned

Some of the most valuable lessons from these projects were not writing resources, but understanding:

- Why state management matters
- How remote backends prevent team conflicts
- Why modules are critical at scale
- How infrastructure evolves across environments
- How Terraform integrates into real CI/CD workflows
- How cloud resources relate to application architecture

---

## Next Learning Objectives

Current areas of focus:

- Terraform CI/CD Pipelines
- Kubernetes Infrastructure Automation
- Helm Charts
- GitHub Actions
- AWS EKS
- Observability Stack
- Monitoring and Logging Platforms
- Platform Engineering Practices

---

## About Me

I am currently focused on building practical DevOps and Cloud Engineering skills through project-based learning.

Rather than relying only on tutorials, I use hands-on projects to understand how infrastructure is designed and operated in production environments.

My goal is to become a DevOps Engineer capable of designing, automating, and operating scalable cloud infrastructure using modern engineering practices.

---

## Contact

Feel free to explore the individual project folders for implementation details, architecture decisions, and Terraform code examples.

Every project in this repository was built, tested, deployed, and troubleshooted manually to gain practical infrastructure engineering experience.

