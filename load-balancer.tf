resource "aws_lb" "web-server-lb" {
  name                          = "${var.TAG_DEPLOYMENT_PREFIX}-web-server-lb"
  internal                      = false
  load_balancer_type            = "application"
  security_groups               = ["${aws_security_group.web-server-sg.id}"]
  subnets                       = "${aws_subnet.public-subnet.*.id}"
  # to keep the ip?
  enable_deletion_protection    = "${var.PROTECTED_LB}"

  tags = {
    Name                        = "${var.TAG_DEPLOYMENT_PREFIX}-web-server-lb"
    Organization                = "${var.TAG_CUSTOMER_NAME}"
    Project                     = "${var.TAG_ENV_NAME}"  
  }
}

resource "aws_lb_listener" "web-server-listener-http" {
  load_balancer_arn             = "${aws_lb.web-server-lb.arn}"
  port                          = "80"
  protocol                      = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.web-server-tg-http.arn}"
  }
}

resource "aws_lb_target_group" "web-server-tg-http" {
  name                          = "${var.TAG_DEPLOYMENT_PREFIX}-web-server-http"
  port                          = 80
  protocol                      = "HTTP"
  target_type                   = "instance"
  vpc_id                        = "${aws_vpc.vpc.id}"
  
  tags = {
    Name                        = "${var.TAG_DEPLOYMENT_PREFIX}-web-server-tg-http"
    Organization                = "${var.TAG_CUSTOMER_NAME}"
    Project                     = "${var.TAG_ENV_NAME}"  
  }  
}

resource "aws_lb_target_group_attachment" "web-server-primary-tga-http" {       
  target_group_arn              = "${aws_lb_target_group.web-server-tg-http.arn}"
  target_id                     = "${aws_instance.web-server-primary.id}"
  port                          = 80
}

resource "aws_lb_target_group_attachment" "web-server-failover-tga-http" {   
  target_group_arn              = "${aws_lb_target_group.web-server-tg-http.arn}"
  target_id                     = "${aws_instance.web-server-primary.id}"
  port                          = 80
}