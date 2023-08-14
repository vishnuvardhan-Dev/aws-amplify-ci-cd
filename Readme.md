## AWS-Amplify infrastructure using terraform and setup of CI/CD pipeline with Amplify’s inbuilt functionality.

 ## 
  **✨Breif about AWS-Amplify**
 is a development platform provided by Amazon Web Services (AWS) that simplifies the process of building web and mobile applications. It's designed to help developers quickly create scalable and feature-rich applications by abstracting away many of the complexities involved in setting up and managing backend services, databases, authentication, and more.
  
 

## Deployment with AWS Amplify: Terraform and CI/CD for Reliable, Scalable Apps
   
1. Update the Terraform variables:
    
    * `var.aws_region`: The name of the AWS aws_region.
    
    * `var.app_name`: The name of the AWS Amplify app.
        
    * `var.repository_url`: The URL of the repository associated with the app.
        
    * `var.access_token`: The access token for authentication.
        
    * `var.platform`: The platform on which the app is built.       

    * `var.branch`: The name of the branch to be mapped to the Amplify app. 

    * `var.framework_name`: The framework used in the branch.

    * `var.stage`: The stage used in the app.
    
    * `var.custom_rule_source`, `var.custom_rule_status`, `var.custom_rule_target`: Custom rule details for path redirection.
        
2. Configure the Amplify provider 

3. Resource amplify app and aws_amplify_branch 
    
4. IAM role for Amplify deployment:
    
    * The code includes two additional AWS resources related to IAM roles and policies: `aws_iam_role` and `aws_iam_role_policy`.
        
    * The `aws_iam_role` the resource represents an IAM role for Amplify deployment.
5. Initialize Terraform:
    
    ```bash
    terraform init
    ```
6. Review the Terraform plan:
    
    ```bash
    terraform plan --var-file vars/dev.tfvars
    ```
7. Apply the changes and provision the infrastructure:
    
    * If the planned changes look correct, apply them by running the following command:
        
    
    ```bash
    terraform apply --var-file vars/dev.tfvars
                or 
    terraform apply --var-file vars/dev.tfvars --auto-approve
    ```
8. Wait for the deployment to complete:
    
    * Terraform will now provision the Amplify infrastructure based on the configuration you defined.
        
    * Click on the `Run Build` once.
9. Verify the resources:
    
    * Once Terraform completes, you can verify the provisioned infrastructure by checking your AWS Amplify Console in the AWS Management Console.
        
    * Ensure that your Amplify App is created and configured correctly.

    Once the deployment is complete, you can verify that the AWS Amplify app and IAM role have been created successfully by checking the AWS Management Console or using the AWS CLI.
10. CI/CD pipeline with Amplify’s inbuilt functionality:
    
    * Modify your application's code and push these changes to the associated branch in your code repository.
        
    * Amplify will automatically detect the changes and trigger a new build and deployment.
        
    * Keep an eye on the Amplify Console to track the advancement and verify the successful deployment of your changes.
        
    
    That's all! You've now established a Continuous Integration and Continuous Deployment (CI/CD) pipeline using Amplify's integrated capabilities.
    
    Amplify takes care of the entire process, ensuring that your application is automatically built and deployed each time you push changes to the designated branch. This streamlines the deployment procedure and offers a seamless experience.

11. Destroy (optional):
    
    To destroy the resources created by Terraform and clean up the environment, run the following command:
    
    ```bash
    terraform destroy --var-file vars/dev.tfvars
    ```
## **✨Conclusion**
Setting up an AWS Amplify app using Terraform is a convenient and automated method for preparing all the essential resources to deploy your web application on the AWS Amplify platform. This approach streamlines the process by taking care of resource provisioning automatically.