locals {
  env           = "dev"
  project_id    = "ur-pj-id"
  zone          = "europe-west1-b"
  instance_name = "example-instance-dev"
  machine_type  = "n1-standard-1"
  image_family  = "debian-9"
  image_project = "debian-cloud"
  labels = {
    environment = "dev"
  }
  cloudsql_mysql_sa = "db-sa"
  db_name           = "my-sql-db"
  database_version = "POSTGRES_9_6"
  region = "europe-west1"
  auto_create_subnetworks = true
  prefix = "hw"  
}



