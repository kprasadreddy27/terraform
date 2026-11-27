resource "aws_instance" "mongodb" {
  ami           = local.ami_id
  instance_type = var.instance_type
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = [local.mongodb_sg_id]

  tags = local.common_tags
}

resource "terraform_data" "bootstrap" {
  # Re-run provisioners if this value changes
  triggers_replace = [
    aws_instance.mongodb.id
  ]

  # 1. Establish the connection parameters
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password= "DevOps321"
    host        = aws_instance.mongodb.private_ip
  }

  # 2. Copy a script file from your local machine to the server
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mongodb ${var.environment}"
    ]
  }
}

resource "aws_instance" "redis" {
  ami           = local.ami_id
  instance_type = var.instance_type
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = [local.redis_sg_id]

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-redis"
    }
  )
}

resource "terraform_data" "redis" {
  # Re-run provisioners if this value changes
  triggers_replace = [
    aws_instance.redis.id
  ]

  # 1. Establish the connection parameters
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password= "DevOps321"
    host        = aws_instance.redis.private_ip
  }

  # 2. Copy a script file from your local machine to the server
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh redis ${var.environment}"
    ]
  }
}