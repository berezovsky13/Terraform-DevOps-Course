# Configure AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create IAM User
resource "aws_iam_user" "melina" {
  name = "Melina"
} 