terraform {
  required_version = ">= 0.12"
  required_providers {

    random = {
      source  = "hashicorp/random"
      version = "3.8.1"

    }

    aws = {

      source = "hashicorp/aws"

      version = "6.36.0"
    }

    local = {

      source  = "hashicorp/local"
      version = "2.7.0"
    }

    kubernetes = {

      source  = "hashicorp/kubernetes"
      version = "3.0.1"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.4"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.7"
    }
  }
}
