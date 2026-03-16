aws_region         = "us-east-1"
vpc_cidr           = "10.0.0.0/16"
env                = "stage"
kubernetes_version = "1.33"
min                = 1
max                = 1
desired            = 1
instance_types     = ["t3.medium"]
