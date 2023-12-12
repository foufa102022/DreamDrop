terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "front1212" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "front1212" {
  image = docker_image.front1212.name  
  name  = "front_terraform"
  ports {
    internal = 80
    external = 8004
  }
}
