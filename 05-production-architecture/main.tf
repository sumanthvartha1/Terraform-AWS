module "network" {
  source = "./modules/network"

  vpc_cidr             = var.vpc_cidr
  public_subnet1_cidr  = var.public_subnet1_cidr
  public_subnet2_cidr  = var.public_subnet2_cidr
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet2_cidr = var.private_subnet2_cidr
}


module "ec2" {
  source = "./modules/ec2"

  vpc_id       = module.network.vpc_id
  project_name = var.project_name
  environment  = var.environment
  owner        = var.owner
}


module "payment_alb" {
  source = "./modules/ALB"

  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids

}

module "payment_asg" {
  source = "./modules/ASG"

  private_subnet_ids = module.network.private_subnet_ids
  target_group_arn   = module.payment_alb.target_group_arn
  security_group_id  = module.ec2.aws_security_group_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  project_name       = var.project_name
  environment        = var.environment
  owner              = var.owner



}