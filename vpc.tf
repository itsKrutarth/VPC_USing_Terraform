
resource "aws_vpc" "vpc_tf_dev" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = merge(var.tags, {name = "vpc_tf_dev", owner = "Krutarth Patel"})
#   lifecycle {
#     prevent_destroy = true
#   }
}

resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.vpc_tf_dev.id
  tags = merge(var.tags, {Name = "tf_igw", owner = "Krutarth Patel"})
}

resource "aws_subnet" "public_subnet_tf" {
  vpc_id = aws_vpc.vpc_tf_dev.id
  cidr_block = local.pubic_subnets
  tags = merge(var.tags, {Name = "tf_pub_sunet", owner = "Krutarth Patel"})
}