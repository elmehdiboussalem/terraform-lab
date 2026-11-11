variable "container_name" {
  type        = string
  description = "Name of the Docker container"
  default     = "nginx"
}

variable "host_port" {
  type        = number
  description = "External port exposed on docker01"
  default     = 8080
}

variable "docker_host_ip" {
  description = "IP address of the Docker host"
  type        = string
  default     = "192.168.100.21"
}
