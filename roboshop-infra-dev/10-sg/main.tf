/* module "mongodb_sg" {
    source = "../../tf-module-aws-sg"
    project = var.project
    environment = var.environment
    sg_name = var.mongodb_sg_name
    vpc_id = local.vpc_id
}

module "redis_sg" {
    source = "../../tf-module-aws-sg"
    project = var.project
    environment = var.environment
    sg_name = var.redis_sg_name
    vpc_id = local.vpc_id
} */

module "roboshop_sg" {
    count = length(var.sg_names)
    source = "../../tf-module-aws-sg"
    project = var.project
    environment = var.environment
    sg_name = replace(var.sg_names[count.index], "_", "-")
    vpc_id = local.vpc_id
}