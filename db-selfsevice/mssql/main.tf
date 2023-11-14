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
  from_port         = 1433
  to_port           = 1433
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
resource "aws_db_instance" "this" {
  identifier                          = "teja-${var.identifier}-selfdb"
  engine                              = var.engine
  engine_version                      = var.engine_version
  instance_class                      = var.instance_class
  allocated_storage                   = var.allocated_storage
  storage_type                        = var.storage_type
  storage_encrypted                   = var.storage_encrypted
  kms_key_id                          = var.kms_key_id
  license_model                       = var.license_model
  db_name                             = var.db_name
  username                            = local.db_creds.username
  password                            = local.db_creds.password
  port                                = var.port
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  vpc_security_group_ids              = [aws_security_group.sec_grp.id]
  db_subnet_group_name                = aws_db_subnet_group.db_subnet.name
  parameter_group_name                = aws_db_parameter_group.parametergroup_name
  multi_az                            = var.multi_az
  iops                                = var.iops
  publicly_accessible                 = var.publicly_accessible
  allow_major_version_upgrade         = var.allow_major_version_upgrade
  auto_minor_version_upgrade          = var.auto_minor_version_upgrade
  apply_immediately                   = var.apply_immediately
  maintenance_window                  = var.maintenance_window
  snapshot_identifier                 = var.snapshot_identifier
  skip_final_snapshot                 = var.skip_final_snapshot
  final_snapshot_identifier           = "teja-${var.identifier}-selfdb"
  performance_insights_enabled        = var.performance_insights_enabled
  performance_insights_kms_key_id     = var.performance_insights_enabled
  backup_retention_period             = var.backup_retention_period
  backup_window                       = var.backup_window
  max_allocated_storage               = var.max_allocated_storage
  character_set_name                  = var.character_set_name
  enabled_cloudwatch_logs_exports     = null
  deletion_protection                 = var.deletion_protection
  tags = {
    db-instance = var.db-instance
  }
}
