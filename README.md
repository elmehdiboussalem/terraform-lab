# terraform-lab

## Overview

Terraform deploys an nginx container on a Docker host (`docker01`) through the `kreuzwerker/docker` provider, which connects over SSH. This is a learning lab, part of a larger Terraform + Ansible secure infrastructure project.

## Prerequisites

- Terraform 1.x
- Provider `kreuzwerker/docker ~> 4.6.0` (pinned in `docker-intro/main.tf`, lock file tracked)
- Docker installed on the target host
- SSH key-based access from the machine running Terraform to the Docker host (user `mehdi`, port 22)
- The user must be allowed to use Docker on the target host (`docker` group)

## Variables

Defined in `docker-intro/variables.tf`:

- `docker_host_ip`: IP address of the Docker host (default `192.168.100.21`), used in the outputs
- `host_port`: external port published on the host (default `8080`)
- `container_name`: name of the container

Note: the Docker host address is still written in the `provider` block of `main.tf`. Edit it there if your host differs.

## Usage

```bash
cd docker-intro
terraform init
terraform plan
terraform apply
terraform destroy
```

Always read the plan before applying. Outputs: `test_url` and `container_info`.

## Lessons learned

- **State drift**: the real container had restart policy `no` while the code said `unless-stopped`. Terraform no longer found its container, so `plan` wanted to create a new one. The old container had to be removed before `apply` to avoid a name conflict. Reading the plan first prevented a surprise.
- **Restart policy**: without `restart = "unless-stopped"`, a container does not come back after a host reboot.
- **Docker and firewalls**: published ports bypass UFW. Filtering must be done in the `DOCKER-USER` chain (managed in the companion Ansible repository, not here).

## Not tracked by Git

Terraform state (`*.tfstate*`), the `.terraform/` directory, `*.tfvars` and plan files. No secrets are stored in this repository.
