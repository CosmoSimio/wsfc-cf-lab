#!/bin/bash

# Set the AWS region
region="us-east-2"

# Set the CloudFormation stack name
read -p "Enter a name for the CloudFormation stack: " stackName

# Set the path to the CloudFormation template
templatePath="./windows-wsfc-labstack.yaml"

# Prompt user for parameter values
read -p "Enter the VPC ID where the instances will be launched: " vpcId
read -p "Enter the security group ID for the instances: " securityGroupId
read -p "Enter the key pair name for the instances: " keyName
read -p "Enter a name for the Domain Controller instance: " domainControllerName
read -p "Enter a name for the Collector server instance: " collectorServerName
read -p "Enter the name of the Active Directory domain: " domainName
read -p "Enter the username for the first domain admin: " domainAdmin1
read -s -p "Enter the password for domain administrator user 1: " domainAdmin1Password
echo
read -p "Enter the username for the second domain admin: " domainAdmin2
read -s -p "Enter the password for domain administrator user 2: " domainAdmin2Password
echo
read -p "Enter the username for the third domain admin: " domainAdmin3
read -s -p "Enter the password for domain administrator user 3: " domainAdmin3Password
echo
read -p "Enter a name for the MSSQL instance: " mssqlInstanceName
read -s -p "Enter the password for the sa user in SQL Server: " mssqlPassword
echo
read -p "Enter a name for the Windows Server Failover Cluster: " ClusteredRoleName

# Deploy the stack with user input parameters
aws cloudformation deploy \
    --stack-name $stackName \
    --template-file $templatePath \
    --parameter-overrides \
        "VpcId=$vpcId" \
        "SecurityGroupId=$securityGroupId" \
        "KeyName=$keyName" \
        "DomainControllerName=$domainControllerName" \
        "CollectorServerName=$collectorServerName" \
        "DomainName=$domainName" \
        "DomainAdmin1=$domainAdmin1" \
        "DomainAdmin1Password=$domainAdmin1Password" \
        "DomainAdmin2=$domainAdmin2" \
        "DomainAdmin2Password=$domainAdmin2Password" \
        "DomainAdmin3=$domainAdmin3" \
        "DomainAdmin3Password=$domainAdmin3Password" \
        "MSSQLInstanceName=$mssqlInstanceName" \
        "MSSQLPassword=$mssqlPassword" \
        "ClusteredRoleName=$ClusteredRoleName" \
    --no-execute-changeset \
    --region $region