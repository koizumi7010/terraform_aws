# Internet gatewayの定義
resource "aws_internet_gateway" "inet-gw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name = "tf-inet-gw"
  }
}