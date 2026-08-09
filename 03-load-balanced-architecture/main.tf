module "network" {
  source = "./modules/network"

  vpc_cidr            = var.vpc_cidr
  public_subnet1_cidr = var.public_subnet1_cidr
  public_subnet2_cidr = var.public_subnet2_cidr
  private_subnet_cidr = var.private_subnet_cidr
}


module "payment_server" {
  source = "./modules/ec2"

  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids

  instance_name = var.instance_name
  instance_type = var.instance_type
  key_name      = var.key_name
  project_name  = var.project_name
  environment   = var.environment
  owner         = var.owner
  aws_region    = var.aws_region

}

module "alb" {

  source = "./modules/alb"

  vpc_id = module.network.vpc_id

  public_subnet_ids = module.network.public_subnet_ids

  instance_ids = module.payment_server.instance_ids

}