output "test_url" {
  value = "http://192.168.100.21:${var.host_port}"
}
output "container_info" {
  value = {
    name = docker_container.web.name
    port = var.host_port
    host = "192.168.100.21"
  }
}
