module "vpc" {
  source                    = "./modules/vpc"
  prefix                    = local.prefix
  vpc_cidr_block            = var.vpc_cidr_block
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  availability_zones        = local.availability_zones
}

module "iam" {
  source = "./modules/iam"
  prefix = local.prefix
}

module "sg" {
  source = "./modules/sg"
  prefix = local.prefix
  vpc_id = module.vpc.vpc_id

  depends_on = [module.vpc]
}

module "ec2" {
  source                = "./modules/ec2"
  prefix                = local.prefix
  subnet_id             = module.vpc.public_subnets[0]
  security_group_id     = module.sg.ec2_sg_id
  instance_profile      = module.iam.instance_profile_name
  instance_type         = var.instance_type
  instance_storage_type = var.instance_storage_type
  instance_storage_size = var.instance_storage_size

  depends_on = [module.vpc, module.iam, module.sg]
}
