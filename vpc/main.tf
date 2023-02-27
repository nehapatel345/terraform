module "vpc" {
  source     = "./modules"
  project_id = "inavolan"
  vpc_name   = "neha-vpc"
  region     = "us-central1"
  zone       = "us-central1-a"
  // auto_create_subnetworks_val =  false
  //ip_cidr_range               =  "10.2.0.0/16"
  subnetwork_name = "subnetwork1"
  firewall_name   = "my-firewall-rule1"
  protocol        = "tcp"
  source_tag      = "web"
  port1           = "80"
  port2           = "8080"
  port3           = "22"
}
