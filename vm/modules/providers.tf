provider "google" {
  alias   = "tokengen"
    project = var.project_id
  region  = var.region
  zone    = var.zone
}
data "google_client_config" "default" {
  provider = "google.tokengen"
}
data "google_service_account_access_token" "sa" {
  provider               = "google.tokengen"
  target_service_account = "neha-service-account@inavolan.iam.gserviceaccount.com"
  lifetime               = "600s"
scopes = [
    "https://www.googleapis.com/auth/cloud-platform",
  ]
}
provider "google" {
  access_token = data.google_service_account_access_token.sa.access_token
  project      = "inavolan"
}
