output "novac_vpc_id" {
  value = module.network.vpc_id
}

output "public_subnets" {
  value = module.network.public_subnets
}

# the outputs from the ec2 module all are dynamically using maps to capture multiple instances
# output "ec2_public_ips" {
#   value = { for k, m in module.ec2 : k => m.public_ip }
# }

output "ec2_EIP" {
  value = { for k, m in module.ec2 : k => m.ec2_EIP }
}

output "ec2_public_ids" {
  value = { for k, m in module.ec2 : k => m.public_id }
}
