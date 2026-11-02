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
