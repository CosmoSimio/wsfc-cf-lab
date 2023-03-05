# Set the AWS region
$region = "us-east-2"

# Set the CloudFormation stack name
$stackName = Read-Host "Enter a name for the CloudFormation stack"

# Set the path to the CloudFormation template
$templatePath = ".\windows-wsfc-labstack.yaml"

# Prompt user for parameter values
$vpcId = Read-Host "Enter the VPC ID where the instances will be launched"
$securityGroupId = Read-Host "Enter the security group ID for the instances"
$keyName = Read-Host "Enter the key pair name for the instances"
$domainControllerName = Read-Host "Enter a name for the Domain Controller instance"
$collectorServerName = Read-Host "Enter a name for the Collector server instance"
$domainName = Read-Host "Enter the name of the Active Directory domain"
$domainAdmin1 = Read-Host "Enter the username for the first domain admin"
$domainAdmin1Password = Read-Host "Enter the password for domain administrator user 1" -AsSecureString
$domainAdmin2 = Read-Host "Enter the username for the second domain admin"
$domainAdmin2Password = Read-Host "Enter the password for domain administrator user 2" -AsSecureString
$domainAdmin3 = Read-Host "Enter the username for the third domain admin"
$domainAdmin3Password = Read-Host "Enter the password for domain administrator user 3" -AsSecureString
$mssqlInstanceName = Read-Host "Enter a name for the MSSQL instance"
$mssqlPassword = Read-Host "Enter the password for the sa user in SQL Server" -AsSecureString
$ClusteredRoleName = Read-Host "Enter a name for the Windows Server Failover Cluster"

# Deploy the stack with user input parameters
aws cloudformation deploy `
    --stack-name $stackName `
    --template-file $templatePath `
    --parameter-overrides `
        "VpcId=$vpcId" `
        "SecurityGroupId=$securityGroupId" `
        "KeyName=$keyName" `
        "DomainControllerName=$domainControllerName" `
        "CollectorServerName=$collectorServerName" `
        "DomainName=$domainName" `
        "DomainAdmin1=$domainAdmin1" `
        "DomainAdmin1Password=$domainAdmin1Password" `
        "DomainAdmin2=$domainAdmin2" `
        "DomainAdmin2Password=$domainAdmin2Password" `
        "DomainAdmin3=$domainAdmin3" `
        "DomainAdmin3Password=$domainAdmin3Password" `
        "MSSQLInstanceName=$mssqlInstanceName" `
        "MSSQLPassword=$mssqlPassword" `
        "ClusteredRoleName=$ClusteredRoleName" `
        "WSFCAdmin=$wsfcAdmin" `
        "WSFCAdminPassword=$wsfcAdminPassword" `
    --no-execute-changeset `
    --region $region