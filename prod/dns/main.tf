terraform {
  cloud {
    organization = "playdust"

    workspaces {
      name = "dns-prod"
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

