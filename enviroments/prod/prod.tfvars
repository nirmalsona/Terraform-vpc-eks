aws_region         = "us-east-1"
vpc_cidr           = "10.0.0.0/16"
env                = "prod"
kubernetes_version = "1.33"
min                = 1
max                = 4
desired            = 2
instance_types     = ["t3.medium"]
