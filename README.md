# AWS Security Groups: Configuration & Management (DA2-CYBER)

This repository contains Infrastructure as Code (IaC) templates for deploying and managing custom AWS EC2 Security Groups, based on the **DA2-CYBER** configuration setup.

## 📌 Security Group Details

* **Group Name**: `DA2-CYBER`
* **Security Group ID**: `sg-0d2534af9d17fc961`
* **VPC ID**: `vpc-088ce6e1f06213fd2`
* **Description**: IN & OUT BOUND INSPECTION
* **Region**: `ap-south-1` (Asia Pacific - Mumbai)

---

## 🔒 Rules Overview

### Inbound Rules (Ingress)
| Type | Protocol | Port Range | Source | Description |
| :--- | :--- | :--- | :--- | :--- |
| HTTP | TCP | 80 | `118.95.161.132/32` | Restricted HTTP Inbound Access |

### Outbound Rules (Egress)
| Type | Protocol | Port Range | Destination | Description |
| :--- | :--- | :--- | :--- | :--- |
| All traffic | ALL | ALL | `0.0.0.0/0` | Allow all outbound traffic |
| HTTPS | TCP | 443 | `0.0.0.0/0` | DA2 outbound inspection |

---

## 🚀 Deployment Instructions

### Option 1: Terraform

1. Initialize Terraform:
   ```bash
   terraform init
