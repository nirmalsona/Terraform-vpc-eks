variable "kubernetes_version" {}
variable "min" {}
variable "max" {}
variable "desired" {}
variable "env" {}
variable "instance_types" {}
variable "vpc_id" {}

variable "subnet_ids" {

type = list(string) 

}


variable "cluster_name" {}

