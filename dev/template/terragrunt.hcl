include "root" {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
  mock_outputs_merge_with_state = true
    mock_outputs        = {
      subnetwork = "subnetwork_self_link"
    }

}


inputs = {
  subnetwork = dependency.vpc.outputs.subnetwork,
}
