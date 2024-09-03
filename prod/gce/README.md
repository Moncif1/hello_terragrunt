This module deploys GCP VM using Terraform Public module of GCP and Terragrunt. 

`**terragrunt.hcl:**` This configuration file, includes settings inherited from a parent directory and a dependency on another module.

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

### Dependency Configuration

The `dependency` block is used to manage dependencies between different modules. 
In this example, the configuration depends on a `template` module located in the `../template` directory. 
The outputs from the `template` module are then used as inputs in the current configuration.

```
dependency "template" {
  config_path = "../template"
}

inputs = {
  instance_template = dependency.template.outputs.self_link
}

```

* **dependency.template:** Refers to the output of the `template` module, which is located at `../template`.
* **instance_template:** The `self_link` output from the `template` module is passed as an input to the current module.