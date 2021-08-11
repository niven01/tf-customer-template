locals {
  softcat-bastion-ext-ip = google_compute_address.softcat_bastion_ext_ip.address
}

module "softcat_bastion" {
  source = "git@bitbucket.org:<Company-Org>/gcp-tf-gce//modules/gce_instance/?ref=master"

  name                      = lookup(var.softcat_bastion, "hostname")
  machine_type              = lookup(var.softcat_bastion, "machine_type")
  region                    = var.region
  zone                      = var.zones[1]
  project_id                = var.project_id
  allow_stopping_for_update = lookup(var.softcat_bastion, "allow_stopping_for_update")
  can_ip_forward            = lookup(var.softcat_bastion, "can_ip_forward")
  deletion_protection       = lookup(var.softcat_bastion, "deletion_protection")
  enable_shielded_vm        = lookup(var.softcat_bastion, "enable_shielded_vm")

  boot_disk_auto_delete = lookup(var.softcat_bastion, "boot_disk_auto_delete")
  boot_disk_source      = module.softcat_bastion_boot_disk.disk_name
  attached_disk         = []

  subnetwork_project = var.project_id
  subnetwork         = lookup(var.softcat_bastion, "subnetwork")
  network_ip         = lookup(var.softcat_bastion, "internal_ip")

  access_config = [
    {
      nat_ip       = local.softcat-bastion-ext-ip
      network_tier = "PREMIUM"
    },
  ]

  service_account = {
    email  = google_service_account.sva_softcat_bastion.email
    scopes = ["cloud-platform"]
  }

  labels   = lookup(var.softcat_bastion, "labels")
  tags     = lookup(var.softcat_bastion, "tags")
  metadata = lookup(var.softcat_bastion, "metadata")

}


module "windows_test" {
  source = "git@bitbucket.org:<Company-Org>/gcp-tf-gce//modules/gce_instance/?ref=master"

  name                      = lookup(var.windows_test, "hostname")
  machine_type              = lookup(var.windows_test, "machine_type")
  region                    = var.region
  zone                      = var.zones[1]
  project_id                = var.project_id
  allow_stopping_for_update = lookup(var.windows_test, "allow_stopping_for_update")
  can_ip_forward            = lookup(var.windows_test, "can_ip_forward")
  deletion_protection       = lookup(var.windows_test, "deletion_protection")
  enable_shielded_vm        = lookup(var.windows_test, "enable_shielded_vm")

  boot_disk_auto_delete = lookup(var.windows_test, "boot_disk_auto_delete")
  boot_disk_source      = module.windows_test_boot_disk.disk_name
  attached_disk         = []

  subnetwork_project = var.project_id
  subnetwork         = lookup(var.windows_test, "subnetwork")
  network_ip         = lookup(var.windows_test, "internal_ip")

  service_account = {
    email  = google_service_account.sva_windows_test.email
    scopes = ["cloud-platform"]
  }

  labels   = lookup(var.windows_test, "labels")
  tags     = lookup(var.windows_test, "tags")
  metadata = lookup(var.windows_test, "metadata")

}
