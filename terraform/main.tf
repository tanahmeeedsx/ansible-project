terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

locals {
  managed_nodes = ["web3", "web4"]
}

resource "aws_security_group" "managed_nodes" {
  name        = "ansible-managed-nodes-sg"
  description = "Allow HTTP from the internet and SSH from the Ansible control node"
  vpc_id      = var.vpc_id

  ingress {
    description     = "SSH from Ansible Control Node security group"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [var.control_node_security_group_id]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "ansible-managed-nodes-sg"
    Environment = "ansible-lab"
    ManagedBy   = "Terraform"
  }
}

resource "aws_instance" "managed_nodes" {
  count = length(local.managed_nodes)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.managed_nodes.id]
  associate_public_ip_address = true

  tags = {
    Name        = local.managed_nodes[count.index]
    Role        = "Ansible Managed Node"
    Environment = "ansible-lab"
    ManagedBy   = "Terraform"
  }
}
