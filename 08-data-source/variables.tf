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

/* variable "ami_id" {
  type        = string
  description = "AMI if of the ec2 instance"
  # default     = "ami-0055977a6e828a4f4"
} */

variable "ec2_tags" {
    type    = map
    default = {
        Name = "roboshop-data-source-demo"
        Environment = "dev"
        Terraform = "true"
        Project = "roboshop"
        Component = "mongodb"
    }
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "from_port" {
    type = number
    default = 0
}