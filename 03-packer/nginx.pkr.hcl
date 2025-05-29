packer {
  required_plugins {
    amazon = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "region" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

source "amazon-ebs" "ubuntu" {
  region        = var.region
  instance_type = var.instance_type
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    most_recent = true
    owners      = ["099720109477"] # Canonical
  }

  ssh_username                = "ubuntu"
  associate_public_ip_address = true

  ami_name  = var.ami_name
  vpc_id    = var.vpc_id
  subnet_id = var.subnet_id
}

build {
  name = "nginx-https-ami"

  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "ansible" {
    playbook_file = "./ansible/nginx.yml"
  }
}
