data "aws_vpc" "VPC" {
  id = "vpc-0449b6a2e58398293"
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = ["vpc-0449b6a2e58398293"]
  }

  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"] 
  }
}

data "aws_subnet" "public" {
  for_each = toset(data.aws_subnets.public.ids)
  id       = each.value
}
