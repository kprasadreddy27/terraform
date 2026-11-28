variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

/* variable "mongodb_sg_name" {
    default = "mongodb"
} */

variable "sg_names" {
    default = [
        "mongodb", "redis", "mysql", "rabbitmq",
        "user", "catalogue", "cart", "shipping", "payment",
        "backend_alb",
        "frontend",
        "frontend_alb",
        "bastion", "vpn"
    ]
}