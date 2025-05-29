# DevOps Exercise – Terraform, Ansible, Packer

This repository is a solution to a test that demonstrates proficiency in Infrastructure as Code (IaC) using **Terraform**, configuration management using **Ansible**, and ami creation using **Packer**.

---

## Objective

Provision an AWS environment with VPC and EC2 and configure an NGINX server with HTTPS using self-signed certificates, and execute the configuration into AMIs for both Linux and Windows EC2 instances.

---

## Project Structure

```
.
├── 01-terraform/ # Terraform scripts to provision AWS infrastructure
├── 02-ansible/ # Ansible playbooks to configure EC2 instances
├── 03-packer/ # Packer templates to build custom AMIs with Ansible
├── 04-screenshots/ # Screenshots showing successful implementation
```

---

## Tools Used

- [Terraform](https://www.terraform.io/)
- [Ansible](https://www.ansible.com/)
- [Packer](https://www.packer.io/)
- AWS (EC2, VPC, IAM, etc.)

---

## Terraform – Infrastructure Provisioning

**Folder:** `01-terraform`

Terraform is used to:

- Create a **VPC** with public subnets.
- Launch an **EC2 instance** in a public subnet.
- Attach an **IAM role** with least-privilege permissions.
- Configure **Security Groups**, **Route Tables**, **Internet Gateway**, etc.

### Key Files

- `main.tf`, `provider.tf`, `variables.tf`, etc.
- `sandbox-values.tfvars` – used for environment-specific values.
- `terraform.tfstate` – stores the infrastructure state.

#### Refer to `04-screenshots/terraform/` for:
- VPC, Subnets, Route Tables, Internet Gateway
- EC2 instance and IAM role configurations

---

## Ansible – NGINX Configuration

**Folder:** `02-ansible`

Ansible playbooks are used to:

- Install **NGINX** on the EC2 instance.
- Generate and configure **self-signed SSL certificates**.
- Enable **HTTPS** on NGINX.

### Key Files

- `inventory.ini` – defines EC2 instance for remote config
- `playbook.ini` – installs NGINX, SSL, and configures the server
- `nginx/` – contains role-specific configurations if modularized

#### Refer to `04-screenshots/ansible/` for:
- Ansible playbook execution logs
- Curl test results over HTTPS

---

## Packer – AMI Creation

**Folder:** `03-packer`

Packer is used to create pre-baked AMIs that include:

- NGINX with HTTPS setup using Ansible
- Separate images for **Ubuntu** and **Windows Server**

### Key Files

- `nginx.pkr.hcl` – Ubuntu NGINX AMI configuration
- `windows.pkr.hcl` – Windows NGINX AMI configuration
- `ansible/` – contains the same Ansible roles/playbooks used for provisioning
- `scripts/` – shell or PowerShell scripts used in Windows image provisioning

#### Refer to `04-screenshots/packer/` for:
- AMI build process for both Ubuntu and Windows

---

## Screenshots – Evidence of Work

**Folder:** `04-screenshots`

Contains visual proof of:

- Successful infrastructure provisioning
- Working HTTPS access to the NGINX server
- AMI build process

### Subfolders:

- `terraform/` – VPC, EC2, IAM
- `ansible/` – Playbook execution and HTTPS test
- `packer/` – AMI build logs and results

---

## Deliverables Summary

| Item | Description |
|------|-------------|
| Terraform Templates | Located in `01-terraform/` |
| Ansible Scripts | Located in `02-ansible/` |
| Packer Templates | Located in `03-packer/` |
| Screenshots | Located in `04-screenshots/` |

---

## Author

**John Robert Ferrer** – DevOps Engineer

work.john.robert.s.ferrer@gmail.com
