# variables.tf

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"  # Free tier eligible
}

variable "ami" {
  description = "AMI ID for Ubuntu 22.04"
  type        = string
  default     = "ami-005fc0f236362e99f"  # The AMI ID provided in the screenshot
}

variable "key_name" {
  description = "Name of the key pair to use for EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the EC2 instance will be launched"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 instance will be launched"
  type        = string
}
