# Create an IAM role for Amplify deployment
resource "aws_iam_role" "amplify_role" {
  # Name of the IAM role
  name = "amplify_deploy_terraform_role"
  
  # Assume role policy document specifying which service can assume this role
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "amplify.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
  tags = {
    Environment = var.stage
    Project     = var.app_name
  }
}


# Attach a policy to the IAM role
resource "aws_iam_role_policy" "amplify_role_policy" {
  # Name of the IAM role policy
  name   = "amplify_iam_role_policy"
  
  # ID of the IAM role to which the policy is attached
  role   = aws_iam_role.amplify_role.id
  
  # Content of the policy from a file (only for testing purpose)
  policy = file("amplify_role_policies.json")
}