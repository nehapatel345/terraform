#instance template

resource "google_compute_instance_template" "ins-temp" {
  name           = var.name
  machine_type   = var.machine
  can_ip_forward = false
  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }
  metadata_startup_script = file(var.file_path)

  disk {
    source_image = var.source_image
    auto_delete  = var.disk_auto_delete
    boot         = var.disk_boot
  }
  network_interface {
    network = var.vpc_network
  }

  lifecycle {
    create_before_destroy = true
  }
   
}

# MIG

resource "google_compute_instance_group_manager" "mig" {
  name               = var.mig_name
  base_instance_name = "neha-vm"
  zone               = var.zone

  version {
    instance_template = google_compute_instance_template.ins-temp.id
  }

  named_port {
    name = "http"
    port = 80
  }
}

# health-check

resource "google_compute_health_check" "health-check" {
  name               = var.health_check_name
  timeout_sec        = var.timeout_sec
  check_interval_sec = var.check_interval_sec

  tcp_health_check {
    port = var.port
  }
}

# autoscaler
resource "google_compute_autoscaler" "default" {

  name   = var.autoscaler_name
  zone   = var.zone
  target = google_compute_instance_group_manager.mig.id

  autoscaling_policy {
    max_replicas    = var.max_replicas
    min_replicas    = var.min_replicas
    cooldown_period = var.cooldown_period
  }
}
# router

resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  network = var.vpc_network
}

# nat

resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = var.router_name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
