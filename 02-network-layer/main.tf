module "network" {
  source = "./modules/network"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
}


module "payment_server" {
  source = "./modules/ec2"

  vpc_id    = module.network.vpc_id
  subnet_id = module.network.public_subnet_id

  instance_name = var.instance_name
  instance_type = var.instance_type
  key_name      = var.key_name
  project_name  = var.project_name
  environment   = var.environment
  owner         = var.owner
  aws_region    = var.aws_region

}

