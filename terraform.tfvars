# AWS接続情報
# ※自身のクレデンシャル情報
aws_access_key        = "*************************************"
aws_secret_key        = "*************************************"

# リージョン
# ※リソースの構築先リージョン
aws_region            = "ap-southeast-1"

# アベイラビリティーゾーン
# ※使用するアベイラビリティ―ゾーン
aws_az1               = "ap-southeast-1a"
aws_az2               = "ap-southeast-1c"

# EC2情報(AMI、インスタンスタイプ)
# ※使用するAMI、インスタンスタイプ
# ※リージョンにより使用可能なAMIが異なるため、AWSマネジメントコンソール等で確認すること
aws_ec2_ami           = "ami-0e5182fad1edfaa68"
aws_ec2_instance_type = "t2.micro"

# RDSログイン情報(ユーザー名、パスワード)
# ※DBに接続するユーザー名・パスワードを記載
aws_rds_master_username = "******"
aws_rds_master_password = "******"