locals {

  # Load Hello World Infra variables
  common_vars = read_terragrunt_config(find_in_parent_folders("common-vars.hcl"))

  # Load Env variables
  env_vars = read_terragrunt_config(find_in_parent_folders("env-vars.hcl"))

  # Load Module variables
  module_vars = read_terragrunt_config("module-vars.hcl")
  env            = local.env_vars.locals.env
  project_id = local.env_vars.locals.project_id
  module_name    = local.module_vars.locals.module_name
  module_source  = local.common_vars.locals["${local.module_name}_base_url"]
  module_version = local.common_vars.locals["${local.module_name}_base_version"]
}

remote_state {
  backend = "gcs"

  config = {
    project = "${local.project_id}"
    location = "eu"
    bucket   = "hw-tf-backend-${local.env}"
    prefix   = "hw/dsi/${local.module_name}"
    credentials = "${get_env("GOOGLE_APPLICATION_CREDENTIALS")}"

  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}


inputs = merge(
  local.common_vars.locals,
  local.env_vars.locals,
  local.module_vars.locals
  
)


terraform {
  source  = "${local.module_source}=${local.module_version}"
}