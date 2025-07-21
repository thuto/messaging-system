#!/bin/bash

# Get the service URL from Terraform output or pass as parameter
SERVICE_URL=$1

if [ -z "$SERVICE_URL" ]; then
  echo "Error: Service URL not provided"
  echo "Usage: $0 <service_url>"
  exit 1
fi

echo "Checking health of service at $SERVICE_URL..."

# Send a curl request to the service
response=$(curl -s -o /dev/null -w "%{http_code}" "$SERVICE_URL" || echo "failed")

# Check if the curl command failed
if [ "$response" = "failed" ]; then
  echo "WARNING: Health check failed! Could not connect to service"
  exit 1
fi

# Check if the response is 200, and return a response
if [ "$response" -eq 200 ]; then
  echo "Health check passed! Service is responding with HTTP $response"
  exit 0
else
  echo "WARNING: Health check failed! Service returned HTTP $response"
  exit 1
fi