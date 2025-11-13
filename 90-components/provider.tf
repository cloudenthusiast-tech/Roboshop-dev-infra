terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.18.0"
    }
  }
}

provider "aws" {
}

terraform {
  backend "s3" {
    bucket = "daws86s-roboshop-dev"
    key = "Roboshop-dev-components"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
    
  }
}