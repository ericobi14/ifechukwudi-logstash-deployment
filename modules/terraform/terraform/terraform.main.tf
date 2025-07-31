module "networking" {
  source             = "../modules/networking"
  vpc_cidr           = var.vpc_cidr
  az_configurations  = var.az_configurations
  common_tags        = var.common_tags
  project_name       = var.project_name
}

module "bastion" {
  source         = "./modules/compute"
  name           = "bastion"
  ami_id         = "ami-02003f9f0fde924ea"
  instance_type  = "t2.micro"
  subnet_id      = module.networking.public_subnet_id
  vpc_id         = module.networking.vpc_id
  ingress_rules  = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      source      = "0.0.0.0/0"
    }
  ]
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      destination = "0.0.0.0/0"
    }
  ]
}

module "logstash" {
  source         = "./modules/compute"
  name           = "logstash"
  ami_id         = "ami-02003f0fde924ea"
  instance_type  = "t2.micro"
  subnet_id      = module.networking.private_subnet_id
  vpc_id         = module.networking.vpc_id
  ingress_rules  = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      source_sg   = module.bastion.security_group_id
    }
  ]
  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      destination = "0.0.0.0/0"
    }
  ]
}

