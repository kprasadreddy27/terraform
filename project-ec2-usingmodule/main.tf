module "ec2" {
  # source = "../terraform-module-or-function"
    source = "git::https://github.com/kprasadreddy27/terraform.git//terraform-module-or-function?ref=main"
    environment = var.project
    project = "genesis"
    component = "mysql"
    sg_ids = ["sg-0b09cb8469e721057"]
}