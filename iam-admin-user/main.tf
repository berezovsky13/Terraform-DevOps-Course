provider "aws" {
  region = "us-east-1"
}

# Step 1: Create IAM User
resource "aws_iam_user" "admin_user" {
  name = "admin-user"
  force_destroy = true
}

# Step 2: Attach AdministratorAccess Policy
resource "aws_iam_user_policy_attachment" "admin_user_attach" {
  user       = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Step 3: Create Console Login Profile (auto-generated password)
resource "aws_iam_user_login_profile" "admin_login" {
  user                    = aws_iam_user.admin_user.name
  password_reset_required = true
}

# Optional: Output the generated password (sensitive)
output "admin_user_password" {
  value     = aws_iam_user_login_profile.admin_login.password
  sensitive = true
}
