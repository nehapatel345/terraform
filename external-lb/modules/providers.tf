terraform {
  required_version = ">= 0.12.26"

  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.43.0"
    }
  }
}

provider "google" {
  project = "inavolan"
  region  = "us-central1"
  zone    = "us-central1-c"
}
