terraform {
  required_version = ">=0.15"

  backend "s3" {
    bucket = "softcat-terraform"
    key    = "<CUSTOMER_NAME>/<CUSTOMER_ENVIRONMENT>/200compute/terraform.tfstate"
    region = "eu-west-2"
  }
  required_providers {
    aws = {
      version = ">= 3.20"
      source  = "hashicorp/aws"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}