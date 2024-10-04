#!/bin/bash

# Update and upgrade the package manager
sudo apt update -y && sudo apt upgrade -y

# Install Git
echo "Installing Git..."
sudo apt install git -y

# Install Docker
echo "Installing Docker..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce

# Add user to the docker group to avoid using 'sudo' with docker commands
sudo usermod -aG docker ${USER}
echo "Docker installed successfully!"

# Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "Docker Compose installed successfully!"

# Install Terraform
echo "Installing Terraform..."
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && sudo apt-get install terraform -y
echo "Terraform installed successfully!"

# Install Node.js and npm
echo "Installing Node.js and npm..."
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "Node.js and npm installed successfully!"

# Install Java (OpenJDK 11 for Spring Boot PetClinic)
echo "Installing Java..."
sudo apt install openjdk-11-jdk -y
echo "Java installed successfully!"

# Install MySQL client (optional)
echo "Installing MySQL client..."
sudo apt install mysql-client -y
echo "MySQL client installed successfully!"

# Check versions of installed software
echo "Installed tool versions:"
git --version
docker --version
docker-compose --version
terraform --version
node --version
npm --version
java -version
mysql --version

echo "All tools installed successfully!"
