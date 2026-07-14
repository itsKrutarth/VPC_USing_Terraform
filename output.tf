

output "azs" {
  value = [for x in local.azs : x]
}

output "pub_subnets" {
  value = [for x in local.pubic_subnets : x]
}

output "private_subnets" {
  value = [for x in local.private_subnets : x]
}