## Project Variables
variable "project_id" {
  description = "The GCP project to use for integration tests"
  type        = string
}

variable "subnetwork_project" {
  description = "The project that subnetwork belongs to"
  default     = ""
}

variable "region" {
  description = "The GCP region where instances will be deployed."
  type        = string
}

variable "zones" {
  description = "The GCP zones where instances can be deployed."
  type        = list(any)
}

variable "environment" {
  description = "Project Environment"
  type        = string
}

variable "network" {
  description = "Network to deploy to. Only one of network or subnetwork should be specified."
  default     = ""
}

variable "subnetwork" {
  description = "Subnet to deploy to. Only one of network or subnetwork should be specified."
  default     = ""
}

## GCE Instance Variables

variable "softcat_bastion" {
  description = "Softcat Bastion Intanace Parameters"
  type = object({
    hostname                  = string
    machine_type              = string
    disk_size_gb              = string
    disk_type                 = string
    labels                    = map(string)
    tags                      = list(string)
    metadata                  = map(string)
    allow_stopping_for_update = bool
    can_ip_forward            = bool
    deletion_protection       = bool
    enable_shielded_vm        = bool

    disk_name             = string
    description           = string
    disk_type             = string
    size                  = number
    enable_backup         = bool
    image                 = string
    boot_disk_auto_delete = bool

    subnetwork  = string
    internal_ip = string

  })
}




