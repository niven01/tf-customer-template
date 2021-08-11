module "softcat_bastion_boot_disk" {
  source = "git@bitbucket.org:<Company-Org>/gcp-tf-disks.git?ref=master"

  project_id    = var.project_id
  disk_name     = lookup(var.softcat_bastion, "disk_name")
  description   = lookup(var.softcat_bastion, "description")
  disk_type     = lookup(var.softcat_bastion, "disk_type")
  zone          = var.zones[1]
  size          = lookup(var.softcat_bastion, "size")
  enable_backup = lookup(var.softcat_bastion, "enable_backup")
  image         = lookup(var.softcat_bastion, "image")
  labels        = lookup(var.softcat_bastion, "labels")
}

module "windows_test_boot_disk" {
  source = "git@bitbucket.org:<Company-Org>/gcp-tf-disks.git?ref=master"

  project_id    = var.project_id
  disk_name     = lookup(var.windows_test, "disk_name")
  description   = lookup(var.windows_test, "description")
  disk_type     = lookup(var.windows_test, "disk_type")
  zone          = var.zones[1]
  size          = lookup(var.windows_test, "size")
  enable_backup = lookup(var.windows_test, "enable_backup")
  image         = lookup(var.windows_test, "image")
  labels        = lookup(var.windows_test, "labels")
}
