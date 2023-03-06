#!/bin/bash

# Set the AWS region
region="us-east-2"

# Set the CloudFormation stack name
read -p "Enter a name for the CloudFormation stack: " stackName

# Set the path to the CloudFormation template
templatePath="./windows-wsfc-labstack.yaml"

# Prompt user for parameter values
read -p "Enter the VPC ID where the instances will be launched: " VpcId
read -p "Enter the security group ID for the instances: " SecurityGroupId
read -p "Enter the key pair name for the instances: " KeyName
read -p "Enter a name for the Domain Controller instance: " DomainControllerName
read -p "Enter a name for the Collector server instance: " CollectorServerName
read -p "Enter the name of the Active Directory domain: " DomainName
read -p "Enter the NetBIOS name of the Active Directory domain: " DomainNetbiosName
read -s -p "Enter the password for the Safe Mode Administrator user: " SafeModeAdministratorPassword
echo
read -p "Enter the username for the first domain admin: " DomainAdmin1
read -s -p "Enter the password for domain administrator user 1: " DomainAdmin1Password
echo
read -p "Enter the username for the second domain admin: " DomainAdmin2
read -s -p "Enter the password for domain administrator user 2: " DomainAdmin2Password
echo
read -p "Enter the username for the third domain admin: " DomainAdmin3
read -s -p "Enter the password for domain administrator user 3: " DomainAdmin3Password
echo
read -p "Enter a name for the MSSQL instance: " MSSQLInstanceName
read -s -p "Enter the password for the sa user in SQL Server: " MSSQLPassword
echo
read -p "Enter a name for the Windows Server Failover Cluster: " ClusteredRoleName

# Construct the parameter overrides string in the format Key=Value
paramsString=""
params=([VpcId]="$vpcId" [SecurityGroupId]="$SecurityGroupId" [KeyName]="$keyName" [DomainControllerName]="$DomainControllerName" [CollectorServerName]="$CollectorServerName" [DomainName]="$DomainName" [DomainAdmin1]="$DomainAdmin1" [DomainAdmin1Password]="$DomainAdmin1Password" [DomainAdmin2]="$DomainAdmin2" [DomainAdmin2Password]="$DomainAdmin2Password" [DomainAdmin3]="$DomainAdmin3" [DomainAdmin3Password]="$DomainAdmin3Password" [MSSQLInstanceName]="$MSSQLInstanceName" [MSSQLPassword]="$MSSQLPassword" [ClusteredRoleName]="$ClusteredRoleName" [DomainNetbiosName]="$DomainNetbiosName" [SafeModeAdministratorPassword]="$SafeModeAdministratorPassword")
for key in "${!params[@]}"
do
    paramsString+=" $key=${params[$key]}"
done

# Deploy the stack
aws cloudformation deploy \
    --stack-name "$stackName" \
    --template-file "$templatePath" \
    --parameter-overrides $paramsString \
    --no-execute-changeset \
    --region $region