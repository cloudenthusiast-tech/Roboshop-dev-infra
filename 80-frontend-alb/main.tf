resource "aws_lb" "frontend_alb" {
  name               = "${local.common_name_suffix}-frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.frontend_alb_sg_id]
  #should be in public subnet
  subnets            = local.public_subnet_ids

  enable_deletion_protection = false # prevents from accidential deletion from UI


  tags=merge(
        local.common_tags,
        {
            Name= "${local.common_name_suffix}-backend-alb"
        }
    )
}

resource "aws_lb_listener" "frontend_alb" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-3-2021-06"
  certificate_arn   = local.frontend_alb_certificate_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>hi, I am from HTTPS frontend_alb"
      status_code  = "200"
    }
  }
}


resource "aws_route53_record" "frotend_alb" {
  zone_id = var.zone_id
  name    = "roboshop-${var.environment}.${var.domain_name}" # roboshop-dev.kolanu.space
  type    = "A"
  allow_overwrite = true

  alias {
    name                   = aws_lb.frotend_alb.dns_name
    zone_id                = aws_lb.frotend_alb.zone_id
    evaluate_target_health = true
  }
}

