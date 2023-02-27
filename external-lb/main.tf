module "lb" {
  source               = "./modules"
  project_id           = "inavolan"
  lb_name              = "neha-lb-terra1"
  region               = "us-central1"
  backend_name         = "neha-backend-terra1"
  protocol             = "HTTP"
  mig_name             = "projects/inavolan/zones/us-central1-c/instanceGroups/neha-mig"
  forwarding_rule_name = "neha-frontend-name1"
  vpc_network          = "neha-vpc"
  temp_name            = "projects/inavolan/global/instanceTemplates/neha-temp"
  machine              = "f1-micro"
//  file_path            = "./modules/s.sh"
  source_image         = "debian-cloud/debian-11"
  disk_auto_delete     = true
  disk_boot            = true
  zone                 = "us-central1-c"
  health_check_name    = "projects/inavolan/global/healthChecks/neha-health-check"
  timeout_sec          = 100
  check_interval_sec   = 100
  port                 = "80"
  autoscaler_name      = "projects/inavolan/zones/us-central1-c/autoscalers/neha-autoscaler"
  max_replicas         = 2
  min_replicas         = 1
  cooldown_period      = 60
  subnetwork_name      = "subnetwork1"
}
