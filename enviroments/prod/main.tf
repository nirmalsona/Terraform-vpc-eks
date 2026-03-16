module "vpc" {
  source = "../../modules/vpc"

  aws_region = var.aws_region
  vpc_cidr   = var.vpc_cidr
  env        = var.env


}

module "eks" {
  source = "../../modules/eks"


  kubernetes_version = var.kubernetes_version
  min                = var.min
  max                = var.max
  desired            = var.desired
  env                = var.env
  instance_types     = var.instance_types
  cluster_name       = module.vpc.cluster_name
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.private_subnets

}
