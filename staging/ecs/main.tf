terraform {
  cloud {
    organization = "playdust"

    workspaces {
      name = "ecs-staging"

    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

data "aws_caller_identity" "current" {}
