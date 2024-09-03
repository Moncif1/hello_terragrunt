This module deploys mysql database using Terraform Public module of GCP and Terragrunt. 

`**terragrunt.hcl:**` This configuration file, includes settings inherited from a parent directory.

## Configuration Files
### Terragrunt Inheritance
This project uses Terragrunt's `include` block to inherit configurations from a parent directory. 
The `include "root"` block with `path = find_in_parent_folders()` is used to locate the root `terragrunt.hcl` file in a parent directory and include its configurations.

```
include "root" {
  path = find_in_parent_folders()
}

```

This setup allows for centralizing configurations, making it easier to manage and maintain common settings across multiple environments or modules. Any variables, remote state configurations, or other settings defined in the parent `terragrunt.hcl` will be applied to this module.