# Packer NGINX AMI

## Structure
- `nginx.pkr.hcl` – Packer file for Linux Ubuntu
- `variables.pkrvars.hcl` – Packer variables (region, AMI name, etc.) for Linux Ubuntu
- `windows.pkr.hcl` – Packer file for Windows
- `windows.pkrvars.hcl` – Packer variables (region, AMI name, etc.) for Windows
- `ansible/` – Ansible playbook files
- `scripts/` – Scripts for windows powershell

## Build Instructions

```bash
cd packer

# Initialize
packer init .

# Format packer files
packer fmt .

# Validate Linux Ubuntu AMI
packer validate -var-file=variables.pkrvars.hcl nginx.pkr.hcl

# Build Linux Ubuntu AMI
packer build -var-file=variables.pkrvars.hcl nginx.pkr.hcl

# Validate Windows AMI
packer validate -var-file="windows.pkrvars.hcl" windows.pkr.hcl

# Build Windows AMI
packer build -var-file=windows.pkrvars.hcl windows.pkr.hcl
```
