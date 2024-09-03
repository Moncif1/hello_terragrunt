locals {
  env           = "stage"
  project_id    = "ur-project-id"
  zone          = "europe-west1-b"
  instance_name = "example-instance"
  machine_type  = "n1-standard-1"
  image_family  = "debian-9"
  image_project = "debian-cloud"
  labels = {
    environment = "prod"
  }
  cloudsql_mysql_sa = "db-sa"
  database_version = "POSTGRES_9_6"
  region = "europe-west1"
  auto_create_subnetworks = true
  prefix = "hw"
  # For example, here we will use a different version of a module
  app_base_version = "3.1.0"
}



