module "vpc" {
    source = "../tf-module-aws-vpc"
    project = "roboshop"
    environment = "dev"
    is_peering_required = true
}