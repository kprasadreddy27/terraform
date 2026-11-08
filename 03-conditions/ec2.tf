resource "aws_instance" "mongodb" {
  ami           = "ami-0055977a6e828a4f4"
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium"
  vpc_security_group_ids = [aws_security_group.mongodb.id]
  
  tags = {
    Name = "roboshop-mongodb"
  }
}

resource "aws_security_group" "mongodb" {
  name        = "mongodb"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-mongodb"
  }
}