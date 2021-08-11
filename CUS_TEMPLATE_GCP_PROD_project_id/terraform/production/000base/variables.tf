variable "project_id" {
  description = "The project ID to host the network in"
}

variable "network_name" {
  description = "The name of the VPC network being created"
}

variable "region" {
  description = "The GCP region where instances will be deployed."
  type        = string
}

variable "environment" {
  description = "Project Environment"
  type        = string
}

variable "subnetwork_1" {
  description = "Subnet 1 name to deploy."
  default     = ""
}

variable "subnetwork_1_ip" {
  description = "Subnet 1 CIDR."
  default     = ""
}

variable "nat_router_name" {
  description = "NAT router name."
  default     = ""
}

variable "cloud_nat_name" {
  description = "NAT name."
  default     = ""
}
