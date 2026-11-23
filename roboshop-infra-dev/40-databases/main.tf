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
    host        = aws_instance.mongodb.priviate_id
  }

  # 2. Copy a script file from your local machine to the server
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh"
    ]
  }
}