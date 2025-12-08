module "network" {
  source = "./modules/network"
}


# BLOCK TO BE COPIED WHEN A NEW EC2 INSTANCE IS NEEDED
# "ansible_slave_agent" = {
#       subnet_id     = module.network.public_subnets[0]
#       security_id   = var.security_id #module.security.security_id
#       server_name   = "ansible_slave_agent"
#       key_name      = var.IaC_key
#       ami           = var.ami_ubuntu
#       instance_type = var.instance_type_t2-micro
#       volume_size   = var.volume_size_12GB
#     }

module "ec2" {
  source = "./modules/ec2"
  for_each = {
    "ansible_server" = {
      subnet_id     = module.network.public_subnets[0]
      security_id   = var.security_id #module.security.security_id
      server_name   = "ansible_server"
      key_name      = var.IaC_key
      ami           = var.ami_ubuntu
      instance_type = var.instance_type_t2-micro
      volume_size   = var.volume_size_12GB
    }

    # "ansible_slave_agent" = {
    #   subnet_id     = module.network.public_subnets[0]
    #   security_id   = var.security_id #module.security.security_id
    #   server_name   = "ansible_slave_agent"
    #   key_name      = var.IaC_key
    #   ami           = var.ami_ubuntu
    #   instance_type = var.instance_type_t2-micro
    #   volume_size   = var.volume_size_12GB
    # }


    # "terraform_test_server" = {
    #   subnet_id     = module.network.public_subnets[0]
    #   security_id   = var.security_id #module.security.security_id
    #   server_name   = "terraform_test_server"
    #   key_name      = var.IaC_key
    #   ami           = var.ami_centos
    #   instance_type = var.instance_type_t2-micro
    #   volume_size   = var.volume_size_20GB
    # }
  }

  ami           = each.value.ami
  subnet_id     = each.value.subnet_id
  security_id   = each.value.security_id
  server_name   = each.value.server_name
  key_name      = each.value.key_name
  instance_type = each.value.instance_type
  volume_size   = each.value.volume_size
}
