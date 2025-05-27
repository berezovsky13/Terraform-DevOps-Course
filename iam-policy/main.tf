# Configure AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create IAM Policy
resource "aws_iam_policy" "my_admins" {
  name = "my-admins"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "*"
        Effect = "Allow"
        Resource = "*"
      }
    ]
  })
} 