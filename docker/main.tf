terraform {                                                                     
  required_providers {                                                          
    docker = {                                                                  
      source  = "kreuzwerker/docker"                                            
      version = "3.0.1"                                                         
    }                                                                           
  }                                                                             
}                                                                               

#provider "docker" {
#  # The Docker host address. If using the default local Docker daemon, you can omit this block.
#  host = "tcp://127.0.0.1:2376"
#}

resource "docker_image" "my_image2" {
  name = "alpine:latest"
}

resource "docker_image" "cpredictor2" {
  name = "artsofcoding/cpredictor:latest"
}

resource "docker_image" "jupyter" {
  name = "miykael/nipype_tutorial:latest"
}

resource "docker_image" "mongo" {
  name = "mongo:latest"
}
