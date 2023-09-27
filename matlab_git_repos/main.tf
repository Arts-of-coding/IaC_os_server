terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {}

module "cobratoolbox" {
  source   = "git::https://github.com/opencobra/cobratoolbox.git?depth=1"
}

module "plotly_matlab" {
  source   = "git::https://github.com/plotly/plotly_matlab.git"
}

module "violin_matlab" {
  source   = "git::https://github.com/bastibe/Violinplot-Matlab.git"
}

# Use a provisioner to move the cloned repository to a custom working directory
resource "null_resource" "move_git_repo" {
  provisioner "local-exec" {
    command = "cp -rf ./.terraform/modules/* /ceph/rimlsfnwi/data/moldevbio/zhou/jarts/MATLAB/toolboxes" # Here you specify your custom working directory
  }
}

# Remove the lock files since they aren't nessesary
resource "null_resource" "remove_dir_lock" {
  provisioner "local-exec" {
    command = "rm -rf .terraform.lock.hcl" # Here you specify your custom working directory
  }
}
