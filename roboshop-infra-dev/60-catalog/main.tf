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

resource "aws_ec2_instance_state" "catalogue" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"
  depends_on = [terraform_data.bootstrap]
  # force     = true # Optional: forces a hard stop without flushing file system caches
}


resource "aws_ami_from_instance" "catalogue" {
  name               = "${local.common_name}-catalogue-${var.app_version}-${aws_instance.catalogue.id}"
  source_instance_id = aws_instance.catalogue.id
  depends_on = [aws_ec2_instance_state.catalogue]
  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name}-catalogue-${var.app_version}-${aws_instance.catalogue.id}"
    }
  )
}

resource "aws_launch_template" "catalogue" {
  name = "${local.common_name}-catalogue"


  image_id = aws_ami_from_instance.catalogue.id

  instance_initiated_shutdown_behavior = "terminate"


  instance_type = "t3.micro"

  vpc_security_group_ids = [local.catalogue_sg_id]
  update_default_version = true

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      local.common_tags,
      {
          Name = "${local.common_name}-catalogue"
      }
    )
  }

  tag_specifications {
    resource_type = "volume"

    tags = merge(
      local.common_tags,
      {
          Name = "${local.common_name}-catalogue"
      }
    )
  }
}
