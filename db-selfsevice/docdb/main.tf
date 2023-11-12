resource "aws_db_subnet_group" "db_subnet" {
  #   count = var.create ? 1 : 0

  name        = "${var.identifier}-dbsubnet"
  description = var.description
  subnet_ids  = [data.aws_subnet.db_subnet_1.id, data.aws_subnet.db_subnet_2.id]

  tags = {
    db-instance = var.db-instance
    #account = var.account
  }
}
resource "aws_security_group" "this" {
  description            = "${var.identifier}-sg"
  vpc_id                 = data.aws_vpc.vpc.id
  revoke_rules_on_delete = true

  tags = {
    db-instance = var.db-instance
    #account = var.account
  }
}
resource "aws_security_group_rule" "sgr" {
  security_group_id = aws_security_group.sec_grp.id
  type              = "ingress"
  cidr_blocks       = ["10.170.2.0/16"]
  description       = "Allow rds within vpc"
  from_port         = var.port
  to_port           = var.port
  protocol          = "tcp"
}
resource "aws_security_group_rule" "sgr2" {
  security_group_id = aws_security_group.sec_grp.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allow rds within vpc"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
}
resource "aws_docdb_cluster_parameter_group" "service" {
  name   = "${var.identifier}-pg"
  family = var.family
  parameter {
    name  = "tls"
    value = "disabled"
  }
  tags = {
    db-instance = var.db-instance
  }
}
resource "aws_docdb_cluster" "docdb" {
  cluster_identifier              = "teja-${var.identifier}-selfdb"
  master_username                 = local.db_creds.username
  master_password                 = local.db_creds.password
  backup_retention_period         = var.backup_retention_period
  preferred_backup_window         = "07:00-09:00"
  final_snapshot_identifier       = var.final_snapshot_identifier
  skip_final_snapshot             = var.skip_final_snapshot
  apply_immediately               = var.apply_immediately
  storage_encrypted               = var.storage_encrypted
  kms_key_id                      = var.kms_key_id
  vpc_security_group_ids          = [aws_security_group.sec_grp.id]
  db_subnet_group_name            = var.db_subnet_group.dbsubnet.name
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.service.name
  engine                          = var.engine
  engine_version                  = var.engine_version
  enabled_cloudwatch_logs_exports = ["audit", "profiler"]
  tags = {
    db-instance = var.db-instance
  }
}
resource "aws_docdb_cluster_instance" "instance" {
  count              = "1"
  identifier         = "teja-${var.identifier}-selfdb"
  cluster_identifier = aws_docdb_cluster_docdb.id
  apply_immediately  = var.apply_immediately
  instance_class     = var.instance_class
  engine             = var.engine
  tags = {
    db-instance = var.db-instance
  }
}