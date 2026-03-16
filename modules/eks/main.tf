module "eks" {

  source = "terraform-aws-modules/eks/aws"

  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  endpoint_public_access                   = true
  enable_cluster_creator_admin_permissions = true

  addons = {
    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      before_compute = true
      most_recent    = true
    }
  }
  vpc_id = var.vpc_id

  subnet_ids = var.subnet_ids


  eks_managed_node_groups = {

    eks_nodes = {
      min_size     = var.min
      max_size     = var.max
      desired_size = var.desired

      instance_types = var.instance_types

      ami_type = "AL2023_x86_64_STANDARD"

      disk_size = 10



      tags = {
        Name        = "nirmal-eks-node"
        Environment = var.env
        Project     = "nirmal-eks"
      }
    }
  }
}

