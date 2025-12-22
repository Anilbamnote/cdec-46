resource "aws_lb_target_group" "tg_home" {
  name     = "tg-home"
  port     = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  health_check {
    path = "/"
    port = 80
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group" "tg_laptop" {
  name     = "tg-laptop"
  port     = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  health_check {
    path = "/laptop/"
    port = 80
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group" "tg_mobile" {
  name     = "tg-mobile"
  port     = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  health_check {
    path = "/mobile/"
    port = 80
    protocol = "HTTP"
  }
}
resource "aws_lb" "my_lb" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_sg.id]
  subnets            = [var.subnet_id_1, var.subnet_id_2]
  tags = {
    app = "my-app"
    env = "dev"
  }
}

resource "aws_lb_listener" "my_lb_listener" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_home.arn
  }
}

resource "aws_lb_listener_rule" "my_lb_listener_rule_laptop" {
  listener_arn = aws_lb_listener.my_lb_listener.arn
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_laptop.arn
  }
  condition {
    path_pattern {
      values = ["/laptop*"]
    }
  }
}

resource "aws_lb_listener_rule" "my_lb_listener_rule_mobile" {
  listener_arn = aws_lb_listener.my_lb_listener.arn
  priority     = 101
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_mobile.arn
  }
  condition {
    path_pattern {
      values = ["/mobile*"]
    }
  }
}