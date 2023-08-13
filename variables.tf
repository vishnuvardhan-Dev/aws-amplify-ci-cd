variable "aws_region" {
  description = "Name of the aws_region"
}
variable "app_name" {
  description = "Name of the Amplify app"
}

variable "branch" {
  description = "Name of the branch"

}

variable "framework_name" {
  description = "Name of the branch"

}

variable "repository_url" {
  description = "URL of the GitHub repository"
}

variable "access_token" {
  description = "Access token for the repository"
}

variable "platform" {
  description = "Platform for the Amplify app"
}

variable "stage" {
  description = "stage for the Amplify app"
}

variable "custom_rule_source" {
  description = "Source for the custom rule"
  default     = "/<*>"
}

variable "custom_rule_status" {
  description = "Status for the custom rule"
  default     = "404-200"
}

variable "custom_rule_target" {
  description = "Target for the custom rule"
  default     = "/index.html"
}
