terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 4.6.0"
    }
  }
}

provider "docker" {
  host = "ssh://mehdi@${var.docker_host_ip}"
}

resource "docker_image" "nginx" {
  name         = "nginx:1.27-alpine"
  keep_locally = true
}

resource "docker_container" "web" {
  name  = var.container_name
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = var.host_port
  }
  restart = "unless-stopped"
}
