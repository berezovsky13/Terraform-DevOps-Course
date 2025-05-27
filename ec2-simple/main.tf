# Configure AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create EC2 Instance
resource "aws_instance" "my_server" {
  ami           = "ami-0c7217cdde317cfec"  # Ubuntu 22.04 LTS
  instance_type = "t2.micro"
  key_name      = "my-key-for-terraform"   # Use the key pair we created earlier

  tags = {
    Name = "my-ubuntu-server"
  }
} 