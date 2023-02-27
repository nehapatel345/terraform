variable "project_id" {
  description = "The GCP project to use for integration tests"
  type        = string
}
variable "machine" {
  description = "VM machine"
  type        = string
  default     = "f1-micro"
}
variable "name" {
  description = "The GCP vm name to create resources in"
  type        = string
}
variable "zone" {
  type = string
}
variable "region" {
  type = string
}
variable "mig_name" {
  description = "The GCP vm name to create resources in"
  type        = string
}
variable "nat_name" {
  type = string
}
variable "router_name" {
  type = string
}
variable "autoscaler_name" {
  type = string
}
variable "source_image" {
  type        = string
  description = "Enter the Image name of the disk"
  default     = "debian-cloud/debian-11"
}
variable "vpc_network" {
  type        = string
  description = "Enter the VPC name"
}
variable "disk_auto_delete" {
  type = string
}
variable "disk_boot" {
  type = string
}
variable "file_path" {
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
variable "max_replicas" {
  type = number
}
variable "min_replicas" {
  type = number
}
variable "cooldown_period" {
  type = number
}
