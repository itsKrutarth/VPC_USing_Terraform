
output "aws_vpc" {
  value = aws_vpc.vpc_tf_dev
}

output "vpc_id" {
  value = aws_vpc.vpc_tf_dev.id
}

output "aws_region" {
  value = var.aws_region
}

output "public_subnets_map" {
  value = {for az, subnet in aws_subnet.public_tf : az => subnet.id}
}

output "pub_subnets" {
  value = [for x in local.public_subnets : x]
}

output "private_subnets" {
  value = [for x in local.private_subnets : x]
}