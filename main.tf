# Require TF version to be same as or greater than 0.12.13
terraform {
  required_version = ">=0.12.24"
  
   backend "s3" {
    bucket = "ddftbackendtf"
    key = "ddftbacked.tfstate"
    region = "us-east-1"
  }
}

# Download any stable version in AWS provider of 2.36.0 or higher in 2.36 train
provider "aws" {
  region  = "us-east-1"
}

# Build the S3
resource "aws_s3_bucket" "b" {
  bucket = "nd-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "New bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket" "test" {
  bucket = "nd-tf-july-bucket"
  acl    = "private"

  tags = {
    Name        = "New bucket"
    Environment = "Dev"
  }
}

/* Commented out until after bootstrap

# Call the seed_module to build our ADO seed info
module "bootstrap" {
  source                      = "./modules/bootstrap"
  name_of_s3_bucket           = "kyler-github-actions-demo-terraform-tfstate"
  dynamo_db_table_name        = "aws-locks"
  iam_user_name               = "GitHubActionsIamUser"
  ado_iam_role_name           = "GitHubActionsIamRole"
  aws_iam_policy_permits_name = "GitHubActionsIamPolicyPermits"
  aws_iam_policy_assume_name  = "GitHubActionsIamPolicyAssume"
}

# Build the VPC
resource "aws_vpc" "vpc" {
  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"

  tags = {
    Name      = "Vpc"
    Terraform = "true"
  }
}

# Build route table 1
resource "aws_route_table" "route_table1" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "RouteTable1"
    Terraform = "true"
  }
}

# Build route table 2
resource "aws_route_table" "route_table2" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "RouteTable2"
    Terraform = "true"
  }
}
*/
