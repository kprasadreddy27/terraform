variable "instance_type" {
    default = "t3.micro"
}

variable "environment" {

}

variable "project" {

}

variable "ec2_tags" {
    default = {}
}

variable "sg_ids" {
    type = list
}

variable "component" {

}