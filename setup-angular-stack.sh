#!/bin/bash

# This script deploys the Angular app to an S3 bucket for hosting

aws cloudformation deploy --stack-name ${1} --capabilities CAPABILITY_IAM --template-file ./angular-app/cloudformation.yml
WEBSITE_URL=`aws cloudformation describe-stacks --stack-name ${1} --output text --query "Stacks[*].Outputs[?OutputKey=='WebsiteURL'].OutputValue"`
BUCKET_NAME=`aws cloudformation describe-stacks --stack-name ${1} --output text --query "Stacks[*].Outputs[?OutputKey=='S3BucketName'].OutputValue"`
echo $WEBSITE_URL
echo $BUCKET_NAME
pushd ./angular-app
# npm install
# npm run build
aws s3 cp dist/angular-app/ s3://${BUCKET_NAME} --recursive
echo "The website is now available at ${WEBSITE_URL}"