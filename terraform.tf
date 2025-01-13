terraform {
  required_providers {
    astro = {
      source  = "astronomer/astro"
      version = "1.0.3"
    }
  }

  # https://developer.hashicorp.com/terraform/language/backend/s3#example-configuration
  backend "s3" {
    bucket = "bas-tf-remote-state"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}

provider "astro" {
  organization_id = "clkvh3b46003m01kbalgwwdcy"
}
