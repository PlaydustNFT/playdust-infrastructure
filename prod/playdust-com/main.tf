terraform {
  cloud {
    organization = "playdust"

    workspaces {
      name = "playdust-com-prod"
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

