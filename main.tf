provider "null" {}

resource "null_resource" "create_conda_environment" {
  provisioner "local-exec" {
    command = "conda create --name my_environment python=3.9 -y"
  }
}

resource "null_resource" "install_packages" {
  provisioner "local-exec" {
    command = "conda activate my_environment && conda install numpy pandas matplotlib -y"
  }
}

resource "null_resource" "export_environment" {
  provisioner "local-exec" {
    command = "conda deactivate"
  }
}
