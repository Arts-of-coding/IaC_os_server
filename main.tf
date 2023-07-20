provider "null" {}

resource "null_resource" "create_conda_environment" {
  provisioner "local-exec" {
    command = "--name my_environment python=3.9 -y"
    interpreter = ["conda", "create","-Command"]
  }
}

resource "null_resource" "install_packages" {
  provisioner "local-exec" {
    command = "conda activate my_environment && conda install numpy pandas matplotlib -y && conda run -n my_environment pip install requests"
    interpreter = ["/bin/bash"]
  }
}

resource "null_resource" "export_environment" {
  provisioner "local-exec" {
    command = "conda env export --name my_environment > environment.yml"
    interpreter = ["/bin/bash"]
  }
}
