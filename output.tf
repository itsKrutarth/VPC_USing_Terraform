
output "aws_vpc" {
  value = aws_vpc.vpc_tf_dev
}

output "vpc_id" {
  value = aws_vpc.vpc_tf_dev.id
}


output "public_subnets_map" {
  value = {for x, id in local.azs : x => local.public_subnets.ids}
}

output "pub_subnets" {
  value = {for x, id in local.public_subnets : x => local.public_subnets.id}
}

output "private_subnets" {
  value = {for x, id in local.private_subnets : x => local.private_subnets.id}
}