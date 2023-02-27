module "compute_engine" {
  source                    = "./modules"
  project_id                = "inavolan"
  name                      = "nehavm"
  region                    = "us-central1"
  zone                      = "us-central1-c"
  vpc_network               = "neha-vpc"
  machine                   = "n1-standard-1"
  service_account_name      = "neha-patel1"
  service_account_id        = "neha-patel1"
  tags                      = "http-server"
  disk_image                = "debian-cloud/debian-11"
  //scratch_disk            = "SCSI"
  scope                     = "cloud-platform"
  deletion_protection       = false
  allow_stopping_for_update = true
}
