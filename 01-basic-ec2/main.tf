module "payment_server" {
  source = "./modules/ec2"

  aws_region    = var.aws_region
  instance_name = var.instance_name
  instance_type = var.instance_type
  key_name      = var.key_name
  project_name  = var.project_name
  environment   = var.environment
  owner         = var.owner
}