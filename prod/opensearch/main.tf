terraform {
  cloud {
    organization = "playdust"

    workspaces {
      name = "opensearch-prod"
    }
  }
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
    elasticsearch = {
      source  = "phillbaker/elasticsearch"
      version = "2.0.1"
    }
  }
}

provider "aws" {
  region = var.region
}

