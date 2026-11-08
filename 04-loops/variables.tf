variable "environment" {
    type = string
    default = "dev"
}

variable "project" {
    type = string
    default = "roboshop"
}

variable "instances" {
    type = list
    default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}

variable "zone_id" {
    default = "Z0833501NF3BMOKRFTAH"
}

variable "domain_name" {
    default = "kpraws.shop"
}