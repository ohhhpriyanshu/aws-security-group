terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS Region where resources will be created"
}

variable "vpc_id" {
  type        = string
  default     = "vpc-088ce6e1f06213fd2"
  description = "Target VPC ID"
}

variable "allowed_inbound_ip" {
  type        = string
  default     = "118.95.161.132/32"
  description = "Allowed IPv4 address for HTTP access"
}

resource "aws_security_group" "da2_cyber" {
  name        = "DA2-CYBER"
  description = "IN & OUT BOUND INSPECTION"
  vpc_id      = var.vpc_id

  # Inbound Rule: HTTP (Port 80) from specific IP
  ingress {
    description = "HTTP Traffic from specific IP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allowed_inbound_ip]
  }

  # Outbound Rule 1: All Traffic to Anywhere
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rule 2: HTTPS Traffic to Anywhere
  egress {
    description = "DA2 HTTPS Outbound"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DA2-CYBER"
  }
}

output "security_group_id" {
  value       = aws_security_group.da2_cyber.id
  description = "The ID of the created Security Group"
}
