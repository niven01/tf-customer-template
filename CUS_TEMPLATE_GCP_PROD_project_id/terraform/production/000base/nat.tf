module "cloud-nat" {
  source        = "git@bitbucket.org:<Company-Org>/gcp-tf-cloud_nat.git/?ref=master"
  router        = var.nat_router_name
  create_router = true
  project_id    = var.project_id
  region        = var.region
  name          = var.cloud_nat_name
  network       = var.network_name
}
