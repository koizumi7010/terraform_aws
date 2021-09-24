########### Part1(アベイラビリティゾーン：ap-northeast-1aの定義) ###########
# NAT Gatewayの定義(private subnet向け。private subnet→NAT GW→Internet GW)
## Elastic IPの定義
resource "aws_eip" "nat-ip-a" {
  vpc           = true
}

## NAT Gatewayの定義
resource "aws_nat_gateway" "nat-gw-a" {
  allocation_id = "${aws_eip.nat-ip-a.id}"
  subnet_id     = "${aws_subnet.public-sub-a.id}"
  tags = {
    Name        = "tf-nat-gw-a"
  }
}


########### Part2(アベイラビリティゾーン：ap-northeast-1cの定義) ###########
# NAT Gatewayの定義(private subnet向け。private subnet→NAT GW→Internet GW)
## Elastic IPの定義
resource "aws_eip" "nat-ip-c" {
  vpc           = true
}

## NAT Gatewayの定義
resource "aws_nat_gateway" "nat-gw-c" {
  allocation_id = "${aws_eip.nat-ip-c.id}"
  subnet_id     = "${aws_subnet.public-sub-c.id}"
  tags = {
    Name        = "tf-nat-gw-c"
  }
}