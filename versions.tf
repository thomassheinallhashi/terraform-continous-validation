terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.26.0"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = "~> 0.93.0"
    }
  }
}    
  backend "remote" {
    organization = "34978-tomstestlab"

    workspaces {
      name = "continous-validation"
    }
  }

}
