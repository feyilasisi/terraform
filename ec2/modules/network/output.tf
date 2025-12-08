output "vpc_id" {
  value = data.aws_vpc.VPC.id
}

output "public_subnets" { #subnet_ids
  value = [for s in data.aws_subnet.public : s.id]
}

