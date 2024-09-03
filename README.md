# Terragrunt_Hello_World

This project manages the infrastructure using Terraform and Terragrunt. 
It organizes and manages different environments and modules, leveraging Terragrunt's capabilities to simplify the configuration and promote DRY (Don't Repeat Yourself) principles.

The configuration is designed to be modular and reusable, with a central configuration that is inherited across different environments or modules.

This setup allows for centralizing configurations, making it easier to manage and maintain common settings across multiple environments and modules. Any variables, remote state configurations, or other settings defined in the parent `terragrunt.hcl` will be applied to this module.


## Table of Contents
* Project Structure
* Prerequisites
* Configuration Files
* Usage
* Backend Configuration
* Inputs
* References

### Project Structure

* env-vars.hcl: Environment-specific variables, such as environment name (env) and project ID (project_id).
* common-vars.hcl: Common variables shared across different modules.
* module-vars.hcl: Module-specific variables, such as module_name, specific to the infrastructure module being used.
* terragrunt.hcl: The main Terragrunt configuration file that ties everything together.

### Prerequisites
* Terraform: Install Terraform
* Terragrunt: Install Terragrunt
* Google Cloud SDK: Required if you're using Google Cloud for the backend state. Install Google Cloud SDK

### Configuration Files
`terragrunt.hcl`
This is the main configuration file where all the variables and configurations are loaded and used to deploy infrastructure.

* Common Variables: Loaded from common-vars.hcl.
* Environment Variables: Loaded from env-vars.hcl.
* Module Variables: Loaded from module-vars.hcl.
#### Remote State
The remote state is stored in a Google Cloud Storage (GCS) bucket. The bucket's name is dynamically created based on the environment.

* Backend Configuration:
    * project: GCP project ID.
    * location: GCS bucket location.
    * bucket: Name of the GCS bucket, dynamically created using the environment name.
    * prefix: Path prefix inside the bucket.
    * credentials: Path to the GCP credentials file.
#### Inputs
The inputs block merges variables from common-vars.hcl, env-vars.hcl, and module-vars.hcl to be used by the Terraform module.

#### Terraform Source
The Terraform module's source is dynamically set using the variables module_source and module_version loaded from the common variables.

#### Usage (by module or by env)

1. Initialize and Plan the infrastructure:

```
terragrunt plan
```
or 
```
terragrunt run-all plan
```

2. Apply the changes:
```
terragrunt apply
```
or
```
terragrunt run-all apply
```

3. Destroy the infrastructure:
```
terragrunt destroy
```
or
```
terragrunt run-all destroy
```
#### Backend Configuration
The remote state configuration is set dynamically by environment and module to use Google Cloud Storage (GCS) with the following settings:

* Project: ${local.project_id}
* Location: eu
* Bucket: hw-tf-backend-${local.env}
* Prefix: hw/dsi/${local.module_name}
* Credentials: Path to the credentials file defined by the GOOGLE_APPLICATION_CREDENTIALS environment variable or a default path.

#### Inputs
The inputs used for the Terraform modules are a combination of common, environment-specific, and module-specific variables. These variables are merged and passed to the Terraform module.

### References

* [Terragrunt Documentation](doc:https://terragrunt.gruntwork.io/docs/)
* [Terraform Registry](doc:https://registry.terraform.io/)
* [Terraform Documentation](doc:https://developer.hashicorp.com/terraform/docs)
* [Google Cloud SDK](doc:https://cloud.google.com/sdk/docs/install)