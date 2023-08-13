# Create an AWS Amplify app resource
resource "aws_amplify_app" "frontend" {
  # Name of the app
  name = var.app_name

  # URL of the repository associated with the app
  repository = var.repository_url

  # Access token for authentication
  access_token = var.access_token



  # Build specification for the app
  build_spec = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - npm install
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: .next
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  # Platform on which the app is built
  platform = var.platform

  # ARN of the IAM service role associated with the app
  iam_service_role_arn = aws_iam_role.amplify_role.arn

  # Custom rule for path redirection
  custom_rule {
    source = var.custom_rule_source
    status = var.custom_rule_status
    target = var.custom_rule_target
  
  }
  
  tags = {
    Environment = var.stage
    Project     = var.app_name
  }
}

# Map git branches to Amplify app
resource "aws_amplify_branch" "main" {
  # ID of the Amplify app to which the branch belongs
  app_id = aws_amplify_app.frontend.id

  # Name of the branch
  branch_name = var.branch

  enable_auto_build = true
  stage     = var.stage
  # Framework used in the branch
  framework = var.framework_name
  
  environment_variables = {
    APP_ENVIRONMENT = "main"
  }
}
