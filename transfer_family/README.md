# Transfer Family Code Companion

## Table of Contents

- [About](#about)
- [Resources Deployed](#resources)
- [Try it](#tryit)

## Project Description <a name = "about"></a>

This is the code companion used in this wiki https://dev.to/friday963/aws-transfer-family-for-network-engineers-4fmf to deploy out the neccessary infrastructure for the transfer family suite of tools. 

## Resources Deployed <a name = "resources"></a>

The required infrastructure includes:
- SFTP server
- Server users
- IAM Role
- IAM Policy
- S3 Bucket (backend for the SFTP server)

### Try it yourself <a name = "tryit">

In order to try it out yourself, you should have the AWS CLI configured with an access key and a secret key.

```
$ aws configure
AWS Access Key ID [None]: <Your Access Key ID>
AWS Secret Access Key [None]: <Your Secret Access Key>
Default region name [None]: <Your Preferred Region>
Default output format [None]: <json or text>

```

### Deploying

Initialize your backend and download providers

```
terraform init
```

Run your terraform plan

```
terraform plan
```

Deploy the infrastructure

```
terraform apply
```

