module "vpc" {
    source = "../../tf-module-aws-vpc"
    project = var.project
    environment = var.environment
}