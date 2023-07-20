provider "null" {}

resource "null_resource" "create_conda_environment_1" {
  provisioner "local-exec" {
    command = "mamba create --name my_environment python=3.9 -y"
  }
}

resource "null_resource" "create_conda_environment_yml1" {
  provisioner "local-exec" {
    command = "mamba env create -f conda_yml/jupyter.yml"
  }
}