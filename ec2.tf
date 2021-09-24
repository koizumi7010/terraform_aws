########### Part1(アベイラビリティゾーン：ap-northeast-1aの定義) ###########
# ec2の定義
resource "aws_instance" "test-a" {
  ami                    = "${var.aws_ec2_ami}"
  instance_type          = "${var.aws_ec2_instance_type}"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  subnet_id              = "${aws_subnet.private-sub-a.id}"
  private_ip             = "10.1.2.5"
  root_block_device {
    volume_type          = "gp2"
    volume_size          = "20"
  }
  iam_instance_profile   = "${aws_iam_instance_profile.inst-prof.name}"
  tags = {
    Name                 = "tf-test-a"
  }
}


########### Part2(アベイラビリティゾーン：ap-northeast-1cの定義) ###########
# ec2の定義
resource "aws_instance" "test-c" {
  ami                    = "${var.aws_ec2_ami}"
  instance_type          = "${var.aws_ec2_instance_type}"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  subnet_id              = "${aws_subnet.private-sub-c.id}"
  private_ip             = "10.1.12.5"
  root_block_device {
    volume_type          = "gp2"
    volume_size          = "20"
  }
  iam_instance_profile   = "${aws_iam_instance_profile.inst-prof.name}"
  tags = {
    Name                 = "tf-test-c"
  }
}