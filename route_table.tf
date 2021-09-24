########### Part1(アベイラビリティゾーン：ap-northeast-1aの定義) ###########
# ルートテーブルの定義(public)
resource "aws_route_table" "public-rt-a" {
  vpc_id           = "${aws_vpc.vpc.id}"
  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id     = "${aws_internet_gateway.inet-gw.id}"
  }
  tags = {
    Name           = "tf-public-rt-a"
  }
}

# ルートテーブルの定義(private)
resource "aws_route_table" "private-rt-a" {
  vpc_id           = "${aws_vpc.vpc.id}"
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat-gw-a.id}"
  }
  tags = {
    Name           = "tf-private-rt-a"
  }
}

# ルートテーブルのルーティング定義(public)
resource "aws_route_table_association" "public-routing-a" {
  subnet_id        = "${aws_subnet.public-sub-a.id}"
  route_table_id   = "${aws_route_table.public-rt-a.id}"
}

# ルートテーブルのルーティング定義(private)
resource "aws_route_table_association" "private-routing-a" {
  subnet_id        = "${aws_subnet.private-sub-a.id}"
  route_table_id   = "${aws_route_table.private-rt-a.id}"
}


########### Part2(アベイラビリティゾーン：ap-northeast-1cの定義) ###########
# ルートテーブルの定義(public)
resource "aws_route_table" "public-rt-c" {
  vpc_id           = "${aws_vpc.vpc.id}"
  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id     = "${aws_internet_gateway.inet-gw.id}"
  }
  tags = {
    Name           = "tf-public-rt-c"
  }
}

# ルートテーブルの定義(private)
resource "aws_route_table" "private-rt-c" {
  vpc_id           = "${aws_vpc.vpc.id}"
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat-gw-c.id}"
  }
  tags = {
    Name           = "tf-private-rt-c"
  }
}

# ルートテーブルのルーティング定義(public)
resource "aws_route_table_association" "public-routing-c" {
  subnet_id        = "${aws_subnet.public-sub-c.id}"
  route_table_id   = "${aws_route_table.public-rt-c.id}"
}

# ルートテーブルのルーティング定義(private)
resource "aws_route_table_association" "private-routing-c" {
  subnet_id        = "${aws_subnet.private-sub-c.id}"
  route_table_id   = "${aws_route_table.private-rt-c.id}"
}