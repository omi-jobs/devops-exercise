# Ansible NGINX Playbook

## Overview

This Ansible playbook installs and configures NGINX with self-signed HTTPS support on an Ubuntu-based EC2 instance.

## Structure

```bash
ansible/
├── README.md
├── tasks/
│   └── nginx
│       ├── install.yml # Installs nginx and openssl
│       ├── ssl.yml # Generates self-signed SSL certs
│       └── config.yml # Configures nginx with SSL
├── inventory.ini # Inventory file with target hosts
└── playbook.yml # Main playbook
```

## Usage

### Step 1: Update Inventory

Edit `inventory.ini` to match your EC2 IP and SSH key:

```ini
[web]
<your-ec2-ip> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/<your-key>.pem
```

### Step 2: Run the Playbook
```bash
cd ansible
ansible-playbook -i inventory.ini playbook.yml
```

### Step 3: Access NGINX
After successful run of ansible playbook, run in terminal:
```bash
curl -k https://47.130.130.41
```

It should return a successful response below:
```html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```
