module "networking" {
  source = "./networking"
}

module "ssh" {
  source = "./ssh"
}

module "ec2" {
  source = "./ec2"

  vpc_id              = module.networking.vpc_id
  public_subnet_id    = module.networking.public_subnet_id
  private_subnet_id   = module.networking.private_subnet_id
  key_name            = module.ssh.key_name
  public_sg_id        = module.networking.public_sg_id
  private_sg_id       = module.networking.private_sg_id
}

