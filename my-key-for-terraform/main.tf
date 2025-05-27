# Configure AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create key pair
resource "aws_key_pair" "my_key" {
  key_name   = "my-key-for-terraform"
  public_key = tls_private_key.my_key.public_key_openssh
}

# Generate private key
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save private key to file
resource "local_file" "private_key" {
  content         = tls_private_key.my_key.private_key_pem
  filename        = "my-key-for-terraform.pem"
  file_permission = "0400"
} 