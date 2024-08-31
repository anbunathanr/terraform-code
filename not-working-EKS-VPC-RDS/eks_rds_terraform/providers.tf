
terraform {
  required_providers {
    
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.7.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}
