#!/bin/bash
# Usage:  ./setup-codebuild.sh project-stack-name githuburl
WEBSITE_URL=`aws cloudformation describe-stacks --stack-name ${1} --output text --query "Stacks[*].Outputs[?OutputKey=='WebsiteURL'].OutputValue"`
BUCKET_NAME=`aws cloudformation describe-stacks --stack-name ${1} --output text --query "Stacks[*].Outputs[?OutputKey=='S3BucketName'].OutputValue"`
aws cloudformation deploy --stack-name ${1} --capabilities CAPABILITY_IAM \
  --template-file ./cypress-tests/cloudformation.yml \
  --parameter-overrides CypressBaseUrl=${WEBSITE_URL} GithubProjectUrl=${2}