terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  credentials = file("ideia_credential.json")
  project     = var.project_id
  region      = "us-east1"
  zone        = "us-east1-a"
}