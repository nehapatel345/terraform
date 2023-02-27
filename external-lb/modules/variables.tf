variable "project_id" {
  type = string
}
variable "lb_name" {
  type = string
}
variable "region" {
  type = string
}
variable "backend_name" {
  type = string
}
variable "protocol" {
  type = string
}
variable "mig_name" {
  type = string
}
variable "forwarding_rule_name" {
  type = string
}
variable "vpc_network" {
  type = string
}
variable "temp_name" {
  type = string
}
variable "machine" {
  type = string
}

variable "source_image" {
  type = string
}
variable "disk_auto_delete" {
  type = bool
}
variable "disk_boot" {
  type = bool
}
variable "zone" {
  type = string
}
variable "health_check_name" {
  type = string
}
variable "timeout_sec" {
  type = number
}
variable "check_interval_sec" {
  type = number
}
variable "port" {
  type = string
}
variable "autoscaler_name" {
  type = string
}
variable "max_replicas" {
  type = number
}
variable "min_replicas" {
  type = number
}
variable "cooldown_period" {
  type = number
}
variable "subnetwork_name" {
  type = string
}
