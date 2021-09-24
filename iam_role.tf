# IAMロールの定義
data "aws_iam_policy_document" "assume-role" {
  statement {
    actions          = ["sts:AssumeRole"]

    principals {
      type           = "Service"
      identifiers    = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iam-role" {
  name = "tf-iam-role-koizumi"
  assume_role_policy = "${data.aws_iam_policy_document.assume-role.json}"
}

data "aws_iam_policy" "systems-manager" {
  arn                = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "default" {
  role               = "${aws_iam_role.iam-role.name}"
  policy_arn         = "${data.aws_iam_policy.systems-manager.arn}"
}

resource "aws_iam_instance_profile" "inst-prof" {
  name               = "tf-inst-prof-koizumi"
  role               = "${aws_iam_role.iam-role.name}"
}