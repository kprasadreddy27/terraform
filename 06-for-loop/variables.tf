variable "instance_type" {
  type        = string
  description = "The size of the EC2 instance"
  default     = "t3.micro"

  # Optional validation rules
   validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Only micro instances are allowed for this environment."
   }
}

variable "ami_id" {
  type        = string
  description = "AMI if of the ec2 instance"
  default     = "ami-0055977a6e828a4f4"
}

variable "instances" {
    type = map
    default = {
        mongodb = {
            instance_type = "t3.micro"
            port_no = 27017
        },
        redis = {
            instance_type = "t3.micro"
            port_no = 6379
        },
        mysql = {
            instance_type = "t3.small"
            port_no = 3306
        },
        rabbitmq = {
            instance_type = "t3.micro"
            port_no = 5672
        }
        catalogue = {
            instance_type = "t3.micro"
            port_no = 8080
        },
        user = {
            instance_type = "t3.micro"
            port_no = 8080
        },
        cart = {
            instance_type = "t3.micro"
            port_no = 8080
        },
        shipping = {
            instance_type = "t3.micro"
            port_no = 8080
        },
        payment = {
            instance_type = "t3.micro"
            port_no = 8080
        },
        frontend = {
            instance_type = "t3.micro"
            port_no = 80
        }
    }
}

variable "environment" {
    type = string
    default = "dev"
}

variable "project" {
    type = string
    default = "roboshop"
}

variable "zone_id" {
    default = "Z0833501NF3BMOKRFTAH"
}

variable "domain_name" {
    default = "kpraws.shop"
}