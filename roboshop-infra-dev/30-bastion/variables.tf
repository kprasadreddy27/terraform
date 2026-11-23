variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

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