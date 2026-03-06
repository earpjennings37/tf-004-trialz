terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.35.0"
    }
  }
  cloud {
    organization = "MyBlogJourney24"
    workspaces {
      name = "tf-004-trialz"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}