provider "aws" {
  region = local.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.35.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"  # Specify the desired version
    }
  }

backend "s3" {
		bucket = "tf-state-hobverse"
		key = "terraform.tfstate"
    region = "eu-west-1"
	}
}


resource "random_string" "suffix" {
  length  = 5
  special = false
}
