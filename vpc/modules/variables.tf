variable "vpc_name" {
    type = string
    description = "Enter the VPC network name"
}
variable "project_id" {
    type = string
    description = "The zone in which to create the VPC network"
}
variable "region" {
    type = string
    description = "The region in which to create the VPC network"
}
variable "zone" {
    type = string
    description = "The zone in which to create the VPC network"
}
variable "subnetwork_name" {
    type = string
    description = "Enter the VPC subnetwork name"
}
variable "protocol" {
    type = string
    description = "Enter the protocol"
}
variable "firewall_name" {
    type = string
    description = "Enter the VPC firewall name"
}
variable "port1" {
    type = string
    description = "Enter the VPC port 1 name"
}
variable "port2" {
    type = string
    description = "Enter the VPC port 2 name"
}
variable "port3" {
    type = string
    description = "Enter the VPC port 3 name"
}
variable "source_tag" {
    type = string
    description = "Enter the source tag"
}
