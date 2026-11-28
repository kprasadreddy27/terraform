# MongoDB is accepting connections from catalogue on port number 27017
resource "aws_vpc_security_group_ingress_rule" "mongodb_catalogue" {
  security_group_id = local.mongodb_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.catalogue_sg_id # source, where is traffic comming from
  # description       = "Allow HTTP from anywhere"
  # cidr_ipv4         = "0.0.0.0/0"
  from_port         = 27017
  ip_protocol       = "tcp"
  to_port           = 27017
}

# MongoDB is accepting connections from user on port number 27017
resource "aws_vpc_security_group_ingress_rule" "mongodb_user" {
  security_group_id = local.mongodb_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.user_sg_id # source, where is traffic comming from
  # description       = "Allow HTTP from anywhere"
  # cidr_ipv4         = "0.0.0.0/0"
  from_port         = 27017
  ip_protocol       = "tcp"
  to_port           = 27017
}

# MongoDB is accepting connections from bastion on port number 27017
resource "aws_vpc_security_group_ingress_rule" "mongodb_bastion" {
  security_group_id = local.mongodb_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.bastion_sg_id # source, where is traffic comming from
  # description       = "Allow HTTP from anywhere"
  # cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

### Redis ###


resource "aws_vpc_security_group_ingress_rule" "redis_user" {
  security_group_id = local.redis_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.user_sg_id # source, where is traffic comming from
  from_port         = 6379
  ip_protocol       = "tcp"
  to_port           = 6379
}

resource "aws_vpc_security_group_ingress_rule" "redis_cart" {
  security_group_id = local.redis_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.cart_sg_id # source, where is traffic comming from
  from_port         = 6379
  ip_protocol       = "tcp"
  to_port           = 6379
}

resource "aws_vpc_security_group_ingress_rule" "redis_bastion" {
  security_group_id = local.redis_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.bastion_sg_id # source, where is traffic comming from
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

### MySql ###

resource "aws_vpc_security_group_ingress_rule" "mysql_shipping" {
  security_group_id = local.mysql_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.shipping_sg_id # source, where is traffic comming from
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
}


resource "aws_vpc_security_group_ingress_rule" "mysql_bastion" {
  security_group_id = local.mysql_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.bastion_sg_id # source, where is traffic comming from
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

### RebbitMQ ###

resource "aws_vpc_security_group_ingress_rule" "rabbitmq_payment" {
  security_group_id = local.rabbitmq_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.payment_sg_id # source, where is traffic comming from
  from_port         = 5672
  ip_protocol       = "tcp"
  to_port           = 5672
}


resource "aws_vpc_security_group_ingress_rule" "rabbitmq_bastion" {
  security_group_id = local.rabbitmq_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.bastion_sg_id # source, where is traffic comming from
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

### catalogue ###

resource "aws_vpc_security_group_ingress_rule" "catalogue_backend_alb" {
  security_group_id = local.catalogue_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.backend_alb_sg_id # source, where is traffic comming from
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_ingress_rule" "catalogue_cart" {
  security_group_id = local.catalogue_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.cart_sg_id # source, where is traffic comming from
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_ingress_rule" "catalogue_bastion" {
  security_group_id = local.catalogue_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.bastion_sg_id # source, where is traffic comming from
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# user
resource "aws_vpc_security_group_ingress_rule" "user_backend_alb" {
  security_group_id = local.user_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.backend_alb_sg_id # source, where is traffic comming from
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_ingress_rule" "user_payment" {
  security_group_id = local.user_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.payment_sg_id # source, where is traffic comming from
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_ingress_rule" "user_bastion" {
  security_group_id = local.user_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.bastion_sg_id # source, where is traffic comming from
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# cart
resource "aws_vpc_security_group_ingress_rule" "cart_backend_alb" {
  security_group_id = local.cart_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.backend_alb_sg_id # source, where is traffic comming from
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_ingress_rule" "cart_shipping" {
  security_group_id = local.cart_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.shipping_sg_id # source, where is traffic comming from
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_ingress_rule" "cart_payment" {
  security_group_id = local.cart_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.payment_sg_id # source, where is traffic comming from
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_ingress_rule" "cart_bastion" {
  security_group_id = local.cart_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.bastion_sg_id # source, where is traffic comming from
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# shipping
resource "aws_vpc_security_group_ingress_rule" "shipping_backend_alb" {
  security_group_id = local.shipping_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.backend_alb_sg_id # source, where is traffic comming from
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_ingress_rule" "shipping_bastion" {
  security_group_id = local.shipping_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.bastion_sg_id # source, where is traffic comming from
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# payment
resource "aws_vpc_security_group_ingress_rule" "payment_bastion" {
  security_group_id = local.payment_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.bastion_sg_id # source, where is traffic comming from
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "payment_backend_alb" {
  security_group_id = local.payment_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.backend_alb_sg_id # source, where is traffic comming from
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

# backend ALB 
resource "aws_vpc_security_group_ingress_rule" "backend_alb_frontend" {
  security_group_id = local.backend_alb_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.frontend_sg_id # source, where is traffic comming from
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "backend_alb_bastion" {
  security_group_id = local.backend_alb_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.bastion_sg_id # source, where is traffic comming from
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "backend_alb_vpn" {
  security_group_id = local.backend_alb_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.vpn_sg_id # source, where is traffic comming from
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

# frontend

resource "aws_vpc_security_group_ingress_rule" "frontend_frontend_alb" {
  security_group_id = local.frontend_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.frontend_alb_sg_id # source, where is traffic comming from
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "frontend_bastion" {
  security_group_id = local.frontend_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.bastion_sg_id # source, where is traffic comming from
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "backend_vpn" {
  security_group_id = local.frontend_sg_id # destination, where you are creating the rule

  referenced_security_group_id = local.vpn_sg_id # source, where is traffic comming from
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# frontend ALB 
resource "aws_vpc_security_group_ingress_rule" "frontend_alb_public_http" {
  security_group_id = local.frontend_alb_sg_id # destination, where you are creating the rule

  description       = "Allow HTTP from anywhere"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "frontend_alb_public_https" {
  security_group_id = local.frontend_alb_sg_id # destination, where you are creating the rule

  description       = "Allow HTTP from anywhere"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

# bastion
resource "aws_vpc_security_group_ingress_rule" "bastion_mylap" {
  security_group_id = local.bastion_sg_id # destination, where you are creating the rule

  description       = "Allow HTTP from anywhere"
  cidr_ipv4         = "${chomp(data.http.my_ipv4.response_body)}/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
