resource "aws_lb" "backend" {
  name               = "${local.common_name}-backend"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_ids

  enable_deletion_protection = false # Should be true in real. but here we need to remove after practice, so keeping it as false

  tags = merge(
    local.common_tags,
    {
        Name = "${local.common_name}-backend"
    }
  )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.backend.arn
  port              = "80"
  protocol          = "HTTP"

  # Default rule
  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi, i am creating backend LB</h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "backend_alb" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.environment}.${var.domain_name}"
  type    = "A"
  allow_overwrite = true

  alias {
    name                   = aws_lb.backend.dns_name
    zone_id                = aws_lb.backend.zone_id
    evaluate_target_health = true
  }
}

