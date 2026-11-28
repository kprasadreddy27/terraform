resource "aws_instance" "catalogue" {
  ami           = local.ami_id
  instance_type = var.instance_type
  subnet_id = local.private_subnet_id
  vpc_security_group_ids = [local.catalogue_sg_id]

  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name}-catalogue"
    }
  )
}

resource "terraform_data" "bootstrap" {
  # Re-run provisioners if this value changes
  triggers_replace = [
    aws_instance.catalogue.id
  ]

  # 1. Establish the connection parameters
  connection {
    type        = "ssh"
    user        = "ec2-user"
    password= "DevOps321"
    host        = aws_instance.catalogue.private_ip
  }

  # 2. Copy a script file from your local machine to the server
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh catalogue ${var.environment} ${var.app_version}"
    ]
  }
}