project_name = "hantt-and-co"
environment  = "sandbox"
aws_region   = "ap-southeast-1"
# VPC
vpc_cidr_block            = "10.0.0.0/16"
public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
# EC2
instance_type         = "t3.micro"
instance_storage_type = "gp3"
instance_storage_size = "8"