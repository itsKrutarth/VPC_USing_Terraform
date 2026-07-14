
data "aws_availability_zones" "available_zones" {
  state = "available"
}


locals {
  azs = slice(data.aws_availability_zones.available_zones.names, 0, 3)
  pubic_subnets = [for k, az in local.azs : cidrsubnet(var.vpc_cidr, var.subnet_newbits, k)]
  private_subnets = [for k, az in local.azs : cidrsubnet(var.vpc_cidr, var.subnet_newbits, k+10)]
}