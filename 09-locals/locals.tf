locals {
    instance_type = "t3.micro"
    common_tags = {
        Name = "roboshop-mongodb"
        Environment = "dev"
        Terraform = "true"
        Project = "roboshop"
        Component = "mongodb"
    }

    ec2_tags = merge(
        local.common_tags,
        {Name = "${var.project}-${var.environment}"}
    )
}