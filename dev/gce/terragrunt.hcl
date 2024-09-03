include "root" {
  path = find_in_parent_folders()
}

### Infinite loop
dependency "template" {
  config_path = "../template"

}


inputs = {
  instance_template = dependency.template.outputs.self_link
}
