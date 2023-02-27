resource "google_compute_global_address" "default" {
  name = "neha-ip1"
}

# forwarding rule
resource "google_compute_global_forwarding_rule" "google_compute_forwarding_rule" {
  name                  = var.forwarding_rule_name
  depends_on            = [google_compute_subnetwork.proxy_subnet]
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "80"
  target                = google_compute_target_http_proxy.default.id
  ip_address            = google_compute_global_address.default.id

}
# proxy-only subnet
resource "google_compute_subnetwork" "proxy_subnet" {
  name          = "l7-ilb-proxy-subnet1"
  provider      = google-beta
  ip_cidr_range = "10.0.0.0/24"
  region        = var.region
  role          = "ACTIVE"
  network       = var.vpc_network
}
# HTTP target proxy
resource "google_compute_target_http_proxy" "default" {
  name    = "l7-ilb-target-http-proxy1"
  url_map = google_compute_url_map.lb.id

}
# URL map
resource "google_compute_url_map" "lb" {
  name            = var.lb_name
  default_service = google_compute_backend_service.default.id
}

# backend service
resource "google_compute_backend_service" "default" {
  name                  = var.backend_name
  protocol              = var.protocol
  load_balancing_scheme = "EXTERNAL_MANAGED"
  timeout_sec           = 10
  health_checks         = [var.health_check_name]
  backend {
    group           = var.mig_name
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}
