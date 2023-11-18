variable "engine" {
  description = "The database engine to use"
  #type        = string
  default = "sqlserver-ex"
}

variable "engine_version" {
  description = "The engine version to use"
  #type        = string
  default = "7.0"
}
variable "node_type" {
  description = "The name of the node type"
  default = "cache.t3a.micro"
}
variable "port" {
  description = "The port on which the DB accepts connections"
  #type        = string
  default = "6379"
}
variable "vpc_name" {
  description = "Name to be used on all the resources as identifier"
  #type        = string
  default = teja-vp-id
}
variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  #type        = bool
  default = false
}
variable "iops" {
  description = "The name of iops"
  #type        = number
  default = null
}
variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  #type        = bool
  default = true
}
variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  #type        = bool
  default = true
}
variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default     = null
}
variable "tags" {
  type = map(string)
  default = {
    #"name" = "value"
  }
}
variable "region" {
  description = "region to deploy resource"
  default     = asia-south-1
}
variable "account_id" {
  description = "aws account"
}
variable "description" {
  description = "Description"
  default     = "subnet group for rds"
}
variable "deployment_region" {
  description = "tag for region"
  type        = string
  default     = "asia-south-1"
}
variable "account" {
  type = number
  description = "tag for aws acc"
  default = "acc_id"
}
# variable "machine_type" {
#   description = "tag for machine type"
#   default     = "rds"
# }
# variable "db-instance" {}
# variable "storage_type" {
#   description = "The name of the storage type"
#   default     = "gp2"
# }
variable "replication_group_id" {
  description = "the name of the replication_group_id"
}
variable "automatic_failover_enabled" {
  description = "The name of the automatic_failover_enabled"
  default = "true"
  type = string
}
variable "num_node_groups" {
  description = "the name of the num_node_groups"
  type = number
}
variable "transit_encryption_enabled" {
  description = "The name of the transit_encryption_enabled "
  type = string
  default = "true"
}
variable "parameter_group_name" {
  description = "The name of the parameter_group_name"
  type = string
  default = "default.redis7.cluster.on"
}
variable "at_rest_encryption_enabled" {
  description = "The name of the at_rest_encryption_enabled"
  type = string
  default = "true"
}