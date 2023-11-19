resource "aws_security_group" "sec_grp_redis" {
  description            = "ec2-${var.name}-selfsrv-sg"
  vpc_id                 = data.aws_vpc.vpc.id
  revoke_rules_on_delete = true
  name = "ec2-${var.name}-selfsrv-sg"

  tags = {
    account = var.account
    #account = var.account
  }
}
# resource "aws_security_group_rule" "sgr" {
#   security_group_id = aws_security_group.sec_grp.id
#   type              = "ingress"
#   cidr_blocks       = ["10.170.2.0/16"]
#   description       = "Allow rds within vpc"
#   from_port         = 6379
#   to_port           = 6379
#   protocol          = "tcp"
# }
resource "aws_security_group_rule" "sgr2" {
  security_group_id = aws_security_group.sec_grp.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow rds within vpc"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}
data "aws_iam_instance_profile" "ec2_sum" {
  name = "SUM-role-for-ec2"
}
resource "aws_instance" "EC2_deploy" {
  #count = local.create && !var.ignore_ami_changes && !var.create_spot_instance ? 1 : 0

  ami                  = var.ami
  instance_type        = var.instance_type
  subnet_id              = data.aws_subnet.pri_subnet_1.id
  vpc_security_group_ids = [aws_security_group.sec_grp.id]
  user_data = var.user_data
  key_name             = var.key_name
  #monitoring           = var.monitoring
  iam_instance_profile = data.aws_iam_instance_profile.ec2_sum.name
  associate_public_ip_address = var.public_ip
  root_block_device {
    delete_on_termination = true
    volume_size = var.volume_size
    volume_type = "gp2"
    encrypted = true
  }
  tags = {
    account = var.account
  }
  depends_on = [ 
    aws_security_group.sec_grp, 
    data.aws_iam_instance_profile.ec2_sum 
    ]
}  
