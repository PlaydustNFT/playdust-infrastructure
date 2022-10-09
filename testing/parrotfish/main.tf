terraform {
  cloud {
    organization = "playdust"

    workspaces {
      name = "parrotfish_testing"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
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

