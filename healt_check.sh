#!/bin/bash

# Get the service URL from Terraform output or pass as parameter
SERVICE_URL=$1

if [ -z "$SERVICE_URL" ]; then
  echo "Error: Service URL not provided"
  echo "Usage: $0 <service_url>"
  exit 1
fi

echo "Checking health of service at $SERVICE_URL..."

# Send request to the service
response=$(curl -s -o /dev/null -w "%{http_code}" $SERVICE_URL)

# Check if the response is 200 OK
if [ $response -eq 200 ]; then
  echo "Health check passed! Service is responding with HTTP $response"
  exit 0
else
  echo "WARNING: Health check failed! Service returned HTTP $response"
  exit 1
fi
