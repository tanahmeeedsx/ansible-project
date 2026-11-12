variable "aws_region" {
  description = "AWS region for the managed EC2 instances"
  type        = string
  default     = "us-west-2"
}

variable "vpc_id" {
  description = "Existing VPC ID"
  type        = string
}

variable "subnet_id" {
  description = "Existing subnet ID for the managed nodes"
  type        = string
}

variable "control_node_security_group_id" {
  description = "Security group ID attached to the Ansible Control Node"
  type        = string
}

variable "ami_id" {
  description = "Ubuntu AMI ID available in the selected AWS region"
  type        = string
}

variable "key_name" {
  description = "Existing EC2 key pair name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for managed nodes"
  type        = string
  default     = "t3.micro"
}
