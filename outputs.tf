# outputs.tf

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.ubuntu_ec2.public_ip
}
