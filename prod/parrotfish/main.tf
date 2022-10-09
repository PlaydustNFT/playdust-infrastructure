terraform {
  cloud {
    organization = "playdust"

    workspaces {
      name = "parrotfish-prod"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}

