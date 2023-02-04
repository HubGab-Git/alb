resource "aws_lb" "test" {
  name               = "test-lb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = var.subnets

  tags = {
    Name = "test-lb"
  }
}

resource "aws_lb_listener" "test" {
  load_balancer_arn = aws_lb.test.arn
  port              = 80
  protocol          = "HTTP"
  
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}

resource "aws_lb_target_group" "test" {
  name     = "test-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id = var.vpc
  
  health_check {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "test" {
    count = length(aws_instance.test)
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.test[count.index].id
  port             = 80
}
