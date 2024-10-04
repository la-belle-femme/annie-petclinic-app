# main.tf

# Create a Security Group for the EC2 instance
resource "aws_security_group" "ec2_security_group" {
  name        = "allow_ssh_http"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = var.vpc_id

  # Ingress rule to allow SSH traffic
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Ingress rule to allow HTTP traffic
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2_security_group"
  }
}

# Provision an EC2 instance
resource "aws_instance" "pet-clinic" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  security_groups = [aws_security_group.ec2_security_group.name]

  tags = {
    Name = "PetClinicAppInstance"
  }
}
