resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [var.security_group]
  subnets            = var.subnets
}

# resource "aws_acm_certificate" "tempdns" {
#   domain_name       = "archerymontessori.com"
#   validation_method = "DNS"
# }

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = aws_acm_certificate.tempdns.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.alb.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   # ssl_policy        = "ELBSecurityPolicy-2016-08"
#   # certificate_arn   = aws_acm_certificate.tempdns.arn
  
#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.target_group.arn
#   }
# }

resource "aws_lb_target_group" "target_group" {
  name        = var.target_group_name
  port        = var.target_group_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

}

resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = var.target_id
  port             = 80
}
