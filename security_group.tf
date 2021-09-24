# セキュリティグループの定義
## HTTPのinboundルール
resource "aws_security_group_rule" "sec-grp-alb-rule" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = "${aws_security_group.alb.id}"
  security_group_id        = "${aws_security_group.ec2.id}"
}

## EC2
resource "aws_security_group" "ec2" {
  name                     = "tf-sec-grp-ec2"
  vpc_id                   = "${aws_vpc.vpc.id}"
  egress {
    from_port              = 0
    to_port                = 0
    protocol               = "-1"
    cidr_blocks            = ["0.0.0.0/0"]
  }
  tags = {
    Name                   = "tf-sec-grp-ec2"
  }
}

## ALB
resource "aws_security_group" "alb" {
  name                     = "tf-sec-grp-alb"
  vpc_id                   = "${aws_vpc.vpc.id}"
  ingress {
    from_port              = 80
    to_port                = 80
    protocol               = "tcp"
    security_groups        = ["${aws_security_group.ec2.id}"]
  }
  egress {
    from_port              = 0
    to_port                = 0
    protocol               = "-1"
    cidr_blocks            = ["0.0.0.0/0"]
  }
  tags = {
    Name                   = "tf-sec-grp-alb"
  }
}

## RDS
resource "aws_security_group" "rds" {
    name                   = "tf-sec-grp-rds"
    vpc_id                 = "${aws_vpc.vpc.id}"
    ingress {
        from_port          = 3306
        to_port            = 3306
        protocol           = "tcp"
        security_groups    = ["${aws_security_group.ec2.id}"]
    }
    egress {
        from_port          = 0
        to_port            = 0
        protocol           = "-1"
        cidr_blocks        = ["0.0.0.0/0"]
    }
    tags = {
        Name               = "tf-sec-grp-rds"
    }
}