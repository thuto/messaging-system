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


CI/CD Pipeline
The GitHub Actions workflow:
Validates Terraform syntax
Builds and pushes Docker images to ECR
Deploys infrastructure changes
Runs automated health checks

Monitoring
CloudWatch log groups for ECS service
CloudWatch alarms for:
RDS CPU usage > 80% for 5 minutes
SQS queue depth > 100 messages for 10 minutes

Cost Optimization Strategies
Fargate Spot for non-critical workloads: Up to 70% cost savings compared to on-demand Fargate
Trade-off: Potential for task interruptions

RDS Reserved Instances: Up to 60% cost savings for committed usage
Trade-off / down-side: Requires upfront commitment (1-3 years)

RDS Optimization Techniques: Right-sizing instance types based on actual usage and traffic

Using Multi-AZ only for production environments: Implementing automated start/stop schedules for non-production
Using gp3 storage instead of gp2 for better performance at the same cost
Implementing automated snapshot cleanup policies (can be run on shell script for manual snap shots)

Security Features
Private subnets for sensitive resources
Security groups with least-privilege access
IAM roles following principle of least privilege
Network ACLs for additional security
Health Check Script

The repository includes a health check script (scripts/health_check.sh) that:
Sends a request to the HTTP service
Logs results and prints a warning if the service is not responding
Can be used for automated monitoring


