module "compute_instance_template" {
  source             = "./modules"
  project_id         = "inavolan"
  mig_name           = "neha-mig"
  name               = "neha-temp"
  vpc_network        = "neha-vpc"
  machine            = "f1-micro"
  health_check_name  = "neha-health-check"
  file_path          = "./modules/startupscript.sh"
  region             = "us-central1"
  zone               = "us-central1-c"
  timeout_sec        = 100
  check_interval_sec = 100
  port               = "80"
  autoscaler_name    = "neha-autoscaler"
  max_replicas       = 2
  min_replicas       = 1
  cooldown_period    = 60
  disk_auto_delete   = true
  disk_boot          = true
  router_name        = "neha-router"
  nat_name           = "neha-nat"
}
