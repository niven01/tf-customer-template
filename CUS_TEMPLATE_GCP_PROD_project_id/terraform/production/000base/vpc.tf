module "vpc" {
  source = "git@bitbucket.org:<Company-Org>/gcp-tf-vpc/?ref=master"

  project_id   = var.project_id
  network_name = var.network_name
  routing_mode = "GLOBAL"

  subnets = [
    {
      subnet_name           = var.subnetwork_1
      subnet_ip             = var.subnetwork_1_ip
      subnet_region         = var.region
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
      description           = "Demo Subnet 01"
    }
  ]
}
