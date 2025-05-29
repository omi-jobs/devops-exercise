# EC2 Instance
resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.instance_profile
  key_name               = aws_key_pair.key_pair.key_name

  associate_public_ip_address = true

  root_block_device {
    volume_type           = var.instance_storage_type
    volume_size           = var.instance_storage_size
    delete_on_termination = true
  }

  tags = {
    Name = "${var.prefix}-ec2-instance"
  }
}

# Elastic IP
resource "aws_eip" "ec2_eip" {
  domain = "vpc"
}

resource "aws_eip_association" "ec2_eip_association" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.ec2_eip.id
}

# Key Pair
resource "aws_key_pair" "key_pair" {
  key_name   = "${var.prefix}-ec2-key-pair"
  public_key = tls_private_key.private_key.public_key_openssh

  depends_on = [tls_private_key.private_key]
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "local_file" "ec2_private_key" {
  content  = tls_private_key.private_key.private_key_pem
  filename = "${var.prefix}-ec2-key-pair.pem"

  depends_on = [tls_private_key.private_key]
}

resource "aws_ssm_parameter" "ec2_private_key_pem" {
  name  = "/${var.prefix}-ec2-key-pair/pem"
  type  = "SecureString"
  value = tls_private_key.private_key.private_key_pem
}
