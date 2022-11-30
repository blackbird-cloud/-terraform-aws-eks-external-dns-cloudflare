terraform {
  required_version = ">= 1"
  required_providers {
    aws = {
      version = "4.15.1"
      source  = "hashicorp/aws"
    }
    helm = {
      version = "2.5.1"
      source  = "hashicorp/helm"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.11.0"
    }
  }
}
