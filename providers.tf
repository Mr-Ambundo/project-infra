terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "gloadout-client" # You'll get this from the console
  region  = "us-central1"
}