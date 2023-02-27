resource "google_compute_network" "vpc_network" {
name       = var.vpc_name
auto_create_subnetworks = true
}

resource "google_compute_subnetwork" "public-subnetwork" {
name            = var.subnetwork_name
ip_cidr_range   = "10.2.0.0/16"
region          = var.region
network         = google_compute_network.vpc_network.name
}

resource "google_compute_firewall" "rules" {
  name            = var.firewall_name
  network         =  google_compute_network.vpc_network.name

  allow {
    protocol = var.protocol
    ports    = [var.port1, var.port2, var.port3]
  }
  source_tags     = [var.source_tag]
  source_ranges   = ["130.211.0.0/22","35.191.0.0/16","35.235.240.0/20"]
}

