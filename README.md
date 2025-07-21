AWS Messaging System Infrastructure

Overview
This project provisions an AWS-based infrastructure for a simple messaging system using Terraform. It deploys a containerized HTTP service with supporting AWS services for a robust messaging platform.

Architecture
The solution includes:

-VPC with public/private subnets across two availability zones

-ECS Fargate cluster running the hashicorp/http-echo service

-RDS PostgreSQL instance in private subnets

-DynamoDB table for metadata storage

-SQS queue and SNS topic with subscription

-Application Load Balancer for public access

-CloudWatch logs and alarms

-CI/CD pipeline using GitHub Actions

Prerequisites

-AWS account with appropriate permissions

-Terraform v1.0.0+

-GitHub account (for CI/CD)

-AWS CLI configured locally

-Deployment Instructions
-Clone this repository

Set up AWS credentials:
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="eu-west-1"


Intitialise terraform
Terraform init


Apply below config:
terraform apply -var="db_username=admin" -var="db_password=your-secure-password"


Access the service:
echo $(terraform output -raw service_url)


================================================================================================================================
================================================================================================================================





