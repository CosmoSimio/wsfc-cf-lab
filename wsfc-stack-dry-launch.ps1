# Set the AWS region
$region = "us-east-2"

# Set the CloudFormation stack name
$stackName = "wsfc-stack"

# Set the path to the CloudFormation template
$templatePath = ".\windows-wsfc-labstack.yaml"

# Set the parameter overrides for the CloudFormation stack
$params = "VpcId=vpc-12345678", `
          "SecurityGroupId=sg-12345678", `
          "KeyName=mykeypair", `
          "DomainControllerName=ec2windc1", `
          "CollectorServerName=ec2wincoll1", `
          "DomainName=isaaclabdom.local", `
          "DomainAdmin1=isaac.paramo", `
          "DomainAdmin1Password=Password123", `
          "DomainAdmin2=svc_lacoll", `
          "DomainAdmin2Password=Password456", `
          "DomainAdmin3=svc_dacoll", `
          "DomainAdmin3Password=Password789", `
          "MSSQLInstanceName=ec2winsql1", `
          "MSSQLPassword=MyPassw0rd", `
          "WSFCName=cluster01", `
          "WSFCWitnessInstance=ec2wsfcwit1", `
          "WSFCAdmin=svc_wsfcadmin", `
          "WSFCAdminPassword=MyPassw0rd"

# Deploy the stack
aws cloudformation deploy `
    --stack-name $stackName `
    --template-file $templatePath `
    --parameter-overrides $params `
    --no-execute-changeset `
    --region $region