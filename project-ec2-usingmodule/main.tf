module "ec2" {
    source = "../terraform-module-or-function"
    environment = "dev"
    project = "genesis"
    component = "mysql"
    sg_ids = ["sg-0b09cb8469e721057"]
}