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

source "amazon-ebs" "windows" {
  region        = var.region
  instance_type = var.instance_type
  source_ami_filter {
    filters = {
      name                = "Windows_Server-2022-English-Full-Base*"
      virtualization-type = "hvm"
    }
    owners      = ["801119661308"] # Official Microsoft Windows AMIs
    most_recent = true
  }
  communicator   = "winrm"
  winrm_username = "Administrator"
  winrm_use_ssl  = false
  winrm_insecure = true
  winrm_timeout  = "5m"
  user_data_file = "scripts/Enable-WinRM.ps1"
  ami_name       = var.ami_name
  vpc_id         = var.vpc_id
  subnet_id      = var.subnet_id
}

build {
  sources = ["source.amazon-ebs.windows"]

  provisioner "ansible" {
    playbook_file = "ansible/nginx-win.yml"
    user          = "Administrator"
  }
}
