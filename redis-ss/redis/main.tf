resource "aws_elasticache_subnet_group" "redis_sg" {
  #   count = var.create ? 1 : 0

  name        = "${var.replication_group_id}-redissubnetgrp"
  description = var.description
  subnet_ids  = [data.aws_subnet.db_subnet_1.id, data.aws_subnet.db_subnet_2.id]

  tags = {
    account = var.account
  }
}
resource "aws_security_group" "sec_grp_redis" {
  description            = "${var.replication_group_id}-sg"
  vpc_id                 = data.aws_vpc.vpc.id
  revoke_rules_on_delete = true
  name = "${var.replication_group_id}-sg"

  tags = {
    account = var.account
    #account = var.account
  }
}
resource "aws_security_group_rule" "sgr" {
  security_group_id = aws_security_group.sec_grp.id
  type              = "ingress"
  cidr_blocks       = ["10.170.2.0/16"]
  description       = "Allow rds within vpc"
  from_port         = 6379
  to_port           = 6379
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
resource "aws_elasticache_replication_group" "default" {
  #count = module.this.enabled ? 1 : 0
  replication_group_id        = var.replication_group_id 
  description                 = var.description
  node_type                   = var.node_type
  port                        = var.port
  parameter_group_name        = var.parameter_group_name
  subnet_group_name           = aws_elasticache_subnet_group.redis_sg.name
  security_group_ids         = [aws_security_group.sec_grp_redis.id]
  maintenance_window         = var.maintenance_window
  engine = var.engine
  engine_version             = var.engine_version
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled 
  apply_immediately          = var.apply_immediately
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  automatic_failover_enabled  = var.automatic_failover_enabled

  lifecycle {
    ignore_changes = [ engine_version ]
  }
  tags = {
    account = var.account
    multi_az = var.multi_az
  }

}