# ALB
## ALBの定義
resource "aws_lb" "alb" {
  name               = "tf-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.alb.id}"]
  subnets            = ["${aws_subnet.private-sub-a.id}", "${aws_subnet.private-sub-c.id}"]
}

## ALBのターゲットグループ定義
resource "aws_lb_target_group" "alb" {
  name               = "tf-alb-tgt-grp"
  port               =  80
  protocol           = "HTTP"
  vpc_id             = "${aws_vpc.vpc.id}"
}

## ALBのターゲットグループにターゲットをアタッチ
### 1つめのターゲット
resource "aws_lb_target_group_attachment" "alb1" {
  target_group_arn   = "${aws_lb_target_group.alb.arn}"
  target_id          = "${aws_instance.test-a.id}"
  port               = 80
}

### 2つめのターゲット
resource "aws_lb_target_group_attachment" "alb2" {
  target_group_arn   = "${aws_lb_target_group.alb.arn}"
  target_id          = "${aws_instance.test-c.id}"
  port               = 80
}

### ALBのListner定義
resource "aws_lb_listener" "alb" {
  load_balancer_arn  = "${aws_lb.alb.arn}"
  port               = 80
  protocol           = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.alb.arn}"
  }
}