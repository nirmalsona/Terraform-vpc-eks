provider "aws" {

  region = var.aws_region

}

data "aws_availability_zones" "availbile" {}

resource "random_string" "suffix" {

  length = 8

  special = false

}


locals {

  cluster_name = "nirmal-eks${random_string.suffix.result}"

}

module "vpc" {

  source = "terraform-aws-modules/vpc/aws"

  version = "6.6.0"
  name    = "nirmal-vpc"

  cidr = var.vpc_cidr

  azs = slice(data.aws_availability_zones.availbile.names, 0, 2)

  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true

  single_nat_gateway = true

  one_nat_gateway_per_az = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {

    Name                                          = "nirmal-vpc"
    Environment                                   =  var.env
    Project                                       = "nirmal-eks"
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"

  }


  public_subnet_tags = {

    Name                                          = "nirmal-public-subnet"
    Environment                                   = "dev"
    Project                                       = "nirmal-eks"
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"

    "kubernetes.io/role/elb" = "1"
  }

  private_subnet_tags = {

    Name                                          = "nirmal-private-subnet"
    Environment                                   = "dev"
    Project                                       = "nirmal-eks"
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"

    "kubernetes.io/role/internal-elb" = "1"
  }



}


