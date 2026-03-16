terraform {
    backend "s3" {
    bucket = "terraform-eks-state-bucket-nirmal"
    key    = "prod/terraform.tfstate"
    region = "us-east-1"
  }
}
