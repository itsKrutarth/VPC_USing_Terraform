
variable "aws_region" {
  description = "aws region to deploy resources"
  type = string
  default = "us-east-2"
}

variable "environment" {
  description = "Environment name used in resource names and tags"
  type = string
  default = "dev"
}

variable "vpc_cidr" {
  description = "overall ip address range"
  type = string
  default = "10.0.0.0/16"
}

variable "tags" {
  description = "Global tags to apply to all resources"
  type = map(string)
  default = {
    "Terraform" = "true"
  }
}

variable "subnet_newbits" {
  description = "Numer of new bits we need to add to VPC CIDR to generate subnets"
  type = number
  default = 8
}