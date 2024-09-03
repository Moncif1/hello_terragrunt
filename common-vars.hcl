locals {
  app_base_version = "3.1.1"
  db_base_version  = "21.0.1"
  vpc_base_version = "9.1.0"
  template_base_version = "11.1.0"
  gce_base_version = "11.1.0"
  gce_base_url     = "tfr:///terraform-google-modules/vm/google//modules/compute_instance?version"
  db_base_url      = "tfr:///GoogleCloudPlatform/sql-db/google//modules/postgresql?version"
  vpc_base_url     = "tfr:///terraform-google-modules/network/google//modules/vpc?version"
  template_base_url = "tfr:///terraform-google-modules/vm/google//modules/instance_template?version"
  service_account = {
    email: "sa_email",
    scopes: [
      "compute-rw"
    ]
  }
}
