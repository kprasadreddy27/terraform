module "ec2" {
    source = "../terraform-module-or-function"
    environment = var.project
    project = "genesis"
    component = "mysql"
    sg_ids = ["sg-0b09cb8469e721057"]
}