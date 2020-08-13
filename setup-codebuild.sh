#!/bin/bash
# Usage:  ./setup-codebuild.sh angular-stack-name cypress-stack-name githuburl
WEBSITE_URL=`aws cloudformation describe-stacks --stack-name ${1} --output text --query "Stacks[*].Outputs[?OutputKey=='WebsiteURL'].OutputValue"`/
BUCKET_NAME=`aws cloudformation describe-stacks --stack-name ${1} --output text --query "Stacks[*].Outputs[?OutputKey=='S3BucketName'].OutputValue"`
echo $WEBSITE_URL
echo $BUCKET_NAME
aws cloudformation deploy --stack-name ${2} --capabilities CAPABILITY_NAMED_IAM \
  --template-file ./cypress-tests/cloudformation.yml \
  --parameter-overrides CypressBaseUrl=$WEBSITE_URL GitHubProjectUrl=${3}