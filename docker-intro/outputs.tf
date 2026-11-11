output "test_url" {
  value = "http://${var.docker_host_ip}:${var.host_port}"
}
output "container_info" {
  value = {
    name = docker_container.web.name
    port = var.host_port
    host = "${var.docker_host_ip}"
  }
}
