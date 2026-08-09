module "network" {
  source = "../../modules/network"

  vpc_cidr             = var.vpc_cidr
  public_subnet1_cidr  = var.public_subnet1_cidr
  public_subnet2_cidr  = var.public_subnet2_cidr
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet2_cidr = var.private_subnet2_cidr

  environment  = var.environment
  project_name = var.project_name
}

module "ec2" {
  source = "../../modules/ec2"

  vpc_id       = module.network.vpc_id
  project_name = var.project_name
  environment  = var.environment
  owner        = var.owner
}

module "alb" {
  source = "../../modules/alb"

  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  
  project_name = var.project_name
  environment  = var.environment
}

module "asg" {
  source = "../../modules/asg"

  private_subnet_ids = module.network.private_subnet_ids

  security_group_id = module.ec2.aws_security_group_id

  target_group_arn = module.alb.target_group_arn

  instance_type = var.instance_type
  key_name      = var.key_name

  project_name = var.project_name
  environment  = var.environment
  owner        = var.owner
}