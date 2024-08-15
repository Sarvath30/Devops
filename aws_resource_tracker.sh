#!/bin/bash

################################
# Author: Sarvath
# Date: 15th Aug'2024
# Version: v1
# This script will report the AWS resource usage
################################

# AWS EC2, S3, IAM, Lambda

# set -x  # enable this line for debugging

# Initialize the resourceTracker file
> resourceTracker

# List S3 buckets
echo "S3 buckets:" >> resourceTracker
aws s3 ls >> resourceTracker
echo "-----" >> resourceTracker

# List EC2 instances with filters and use jq to group by instance name & type
echo "EC2 instances:" >> resourceTracker
aws ec2 describe-instances \
  --query "Reservations[].Instances[].{Name: Tags[?Key=='Name']|[0].Value, InstanceType: InstanceType}" \
  | jq -c '.' >> resourceTracker
echo "-----" >> resourceTracker

# List EC2 instances with filters and use jq to group by instance TYPE
echo "No Of EC2 instances:" >> resourceTracker
aws ec2 describe-instances --region ap-south-1 --filters "Name=instance-type,Values=t2.large,t2.medium,t2.small" \
  --query "Reservations[].Instances[].{InstanceType:InstanceType}" \
  | jq "group_by(.InstanceType) | map({(.[0].InstanceType):length})" >> resourceTracker
echo "-----" >> resourceTracker

# List Lambda functions and use jq to display the function names
echo "Lambda Functions:" >> resourceTracker
aws lambda list-functions \
  --query "Functions[].FunctionName" \
  | jq -c '.' >> resourceTracker
echo "-----" >> resourceTracker

# List IAM users and use jq to display usernames
echo "IAM Users:" >> resourceTracker
aws iam list-users \
  --query "Users[].UserName" \
  | jq -c '.' >> resourceTracker
