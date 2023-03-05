#!/bin/bash

# Set the AWS region
region="us-east-2"

# Set the CloudFormation stack name
stackName="wsfc-stack"

# Set the path to the CloudFormation template
templatePath="./windows-wsfc-labstack.yaml"

# Set the parameter overrides for the CloudFormation stack
params="VpcId=vpc-12345678 "
params+="SecurityGroupId=sg-12345678 "
params+="KeyName=mykeypair "
params+="DomainControllerName=ec2windc1 "
params+="CollectorServerName=ec2wincoll1 "
params+="DomainName=isaaclabdom.local "
params+="DomainAdmin1=isaac.paramo "
params+="DomainAdmin1Password=Password123 "
params+="DomainAdmin2=svc_lacoll "
params+="DomainAdmin2Password=Password456 "
params+="DomainAdmin3=svc_dacoll "
params+="DomainAdmin3Password=Password789 "
params+="MSSQLInstanceName=ec2winsql1 "
params+="MSSQLPassword=MyPassw0rd "
params+="ClusteredRoleName=cluster01"

# Deploy the stack
aws cloudformation deploy \
    --stack-name $stackName \
    --template-file $templatePath \
    --parameter-overrides $params \
    --no-execute-changeset \
    --region $region