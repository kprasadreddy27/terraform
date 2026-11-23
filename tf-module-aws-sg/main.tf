resource "aws_security_group" "main" {
  name        = local.final_sg_name
  description = "Allow traffic for ${var.sg_name}"
  vpc_id      = var.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(
    var.sg_tags,
    local.common_tags
  )
}

