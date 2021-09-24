########### Part1(アベイラビリティゾーン：ap-northeast-1aの定義) ###########
# subnet定義(public)
resource "aws_subnet" "public-sub-a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.1.1.0/24"
  availability_zone = "${var.aws_az1}"
  tags = {
    Name            = "tf-public-sub-a"
  }
}

# subnet定義(private)
resource "aws_subnet" "private-sub-a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.1.2.0/24"
  availability_zone = "${var.aws_az1}"
  tags = {
    Name            = "tf-private-sub-a"
  }
}

# subnet定義(RDB Aurora private)
resource "aws_subnet" "rds-sub-a" {
    vpc_id            = "${aws_vpc.vpc.id}"
    cidr_block        = "10.1.3.0/24"
    availability_zone = "${var.aws_az1}"
    tags = {
        Name          = "tf-rds-sub-a"
    }
}


########### Part2(アベイラビリティゾーン：ap-northeast-1cの定義) ###########
# subnet定義(public)
resource "aws_subnet" "public-sub-c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.1.11.0/24"
  availability_zone = "${var.aws_az2}"
  tags = {
    Name            = "tf-public-sub-c"
  }
}

# subnet定義(private)
resource "aws_subnet" "private-sub-c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.1.12.0/24"
  availability_zone = "${var.aws_az2}"
  tags = {
    Name            = "tf-private-sub-c"
  }
}

# subnet定義(RDB Aurora private)
resource "aws_subnet" "rds-sub-c" {
    vpc_id            = "${aws_vpc.vpc.id}"
    cidr_block        = "10.1.13.0/24"
    availability_zone = "${var.aws_az2}"
    tags = {
        Name          = "tf-rds-sub-c"
    }
}