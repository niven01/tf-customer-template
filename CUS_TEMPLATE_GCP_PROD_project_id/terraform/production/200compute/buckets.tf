module "startup_scripts_bucket" {
  source = "git@bitbucket.org:<Company-ORG>/gcp-tf-buckets//modules/simple_bucket/?ref=master"

  name       = "startup-scripts"
  prefix     = "33424443"
  project_id = var.project_id
  location   = "europe-west2"
  versioning = true

  labels = {
    environment = "demo",
    name        = "startup-scripts"
  }
}
