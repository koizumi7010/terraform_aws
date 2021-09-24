# RDS定義
## サブネットグループ
resource "aws_db_subnet_group" "rds-sub-group" {
  name                            = "tf-rds-sub-group"
  subnet_ids                      = ["${aws_subnet.rds-sub-a.id}", "${aws_subnet.rds-sub-c.id}"]
}

## aurora parameter group
resource "aws_db_parameter_group" "rds-prm-group" {
  name                            = "tf-rds-prm-group"
  family                          = "aurora-mysql5.7"
}

## aurora cluster parameter group
resource "aws_rds_cluster_parameter_group" "rds-cluster-prm-gp" {
  name                            = "tf-rds-cluster-prm-gp"
  family                          = "aurora-mysql5.7"
}

## RDS の Auroraを定義
resource "aws_rds_cluster" "rds-cluster" {
  cluster_identifier              = "tf-aurora-cluster-demo"
  engine                          = "aurora-mysql"
  availability_zones              = ["${var.aws_az1}", "${var.aws_az2}"]
  database_name                   = "tf_auroradb"
  master_username                 = "${var.aws_rds_master_username}"
  master_password                 = "${var.aws_rds_master_password}"

  vpc_security_group_ids          = ["${aws_security_group.rds.id}"]

  port                            = 3306
  db_subnet_group_name            = "${aws_db_subnet_group.rds-sub-group.name}"
  storage_encrypted               = true
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.rds-cluster-prm-gp.name}"

  skip_final_snapshot             = true
  lifecycle{
    ignore_changes                = [master_password, availability_zones]
  }
}

## RDS instance
resource "aws_rds_cluster_instance" "rds-cluster-inst" {
  count                           = 2
  identifier                      = "tf-aurora-${count.index}"
  engine                          = "aurora-mysql"
  cluster_identifier              = "${aws_rds_cluster.rds-cluster.id}"
  instance_class                  = "db.t2.medium"
  db_subnet_group_name            = "${aws_db_subnet_group.rds-sub-group.name}"
  db_parameter_group_name         = "${aws_db_parameter_group.rds-prm-group.name}"
  publicly_accessible             = false
}