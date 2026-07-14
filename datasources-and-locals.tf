
data "aws_availability_zones" "available_zones" {
  state = "available"
}


locals {
  azs = slice(data.aws_availability_zones.available_zones, 0, 3)
}