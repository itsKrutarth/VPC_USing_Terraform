
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

resource "aws_subnet" "public_tf" {
  for_each = { for idx, az in local.azs : az => local.pubic_subnets[idx] }
  vpc_id = aws_vpc.vpc_tf_dev.id
  cidr_block = each.value
  availability_zone = each.key
  tags = merge(var.tags, {Name = "pub_tf_${each.key}", owner = "Krutarth Patel"})
}

resource "aws_subnet" "private_tf" {
  for_each = { for x, a in local.azs : a => local.private_subnets[x] }
  vpc_id = aws_vpc.vpc_tf_dev.id
  cidr_block = each.value
  availability_zone = each.key
  tags = merge(var.tags, {Name = "private_tf_${each.key}", owner = "Krutarth Patel"})
}

# elastic ip
resource "aws_eip" "elastic_ip_tf" {
  tags = merge(var.tags, {Name = "nat_tf", owner = "Krutarth Patel"})
}

resource "aws_nat_gateway" "tf_nat_gateway" {
    allocation_id = aws_eip.elastic_ip_tf.id
    subnet_id = values(aws_subnet.public_tf)[0].id
    tags = merge(var.tags, {Name = "tf_nat", owner = "Krutarth Patel"})
    depends_on = [ aws_internet_gateway.tf_igw ]
}


# resource "aws_subnet" "public_subnet_1_tf" {
#   vpc_id = aws_vpc.vpc_tf_dev.id
#   cidr_block = local.pubic_subnets[0]
#   tags = merge(var.tags, {Name = "tf_pub_subset_1", owner = "Krutarth Patel"})
#   availability_zone = local.azs[0]
#   map_public_ip_on_launch = true
# }

# resource "aws_subnet" "private_subnet_1_tf" {
#   vpc_id = aws_vpc.vpc_tf_dev.id
#   cidr_block = local.private_subnets[0]
#   tags = merge(var.tags, {Name = "tf_private_subset_1", owner = "Krutarth Patel"})
#   availability_zone = local.azs[0]
# }

# resource "aws_subnet" "public_subnet_2_tf" {
#   vpc_id = aws_vpc.vpc_tf_dev.id
#   cidr_block = local.pubic_subnets[1]
#   availability_zone = local.azs[1]
#   tags = merge(var.tags, {Name = "tf_public_subset_2", owner = "Krutarth Patel"})
# }

# resource "aws_subnet" "private_subnet_2_tf" {
#   vpc_id = aws_vpc.vpc_tf_dev.id
#   cidr_block = local.private_subnets[1]
#   availability_zone = local.azs[1]
#   tags = merge(var.tags, {Name = "tf_private_subnet_2", owner = "Krutarth Patel"})
# }