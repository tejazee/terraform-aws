variable "identifier" {
  description = "The name of the RDS instance"
  type        = string
}
variable "engine" {
  description = "The database engine to use"
  #type        = string
  default     = docdb
}

variable "engine_version" {
  description = "The engine version to use"
  #type        = string
  default     = "4.0.0"
}
variable "instance_class" {
  description = "The instance type of the RDS instance"
#   type        = string
#   default     = null
}
variable "allocated_storage" {
  description = "The allocated storage in gigabytes"
  #type        = number
  default     = 20
}
variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  #type        = bool
  default     = true
}
variable "license_model" {
  description = "License model information for this DB instance. Optional, but required for some DB engines, i.e. Oracle SE1"
  #type        = string
  default     = null
}
variable "snapshot_identifier" {
  description = "Specifies whether or not to create this database from a snapshot."
  #type        = string
  default     = null
}
variable "db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  #default     = null
}
variable "port" {
  description = "The port on which the DB accepts connections"
  #type        = string
  default     = 27017
}
variable "max_allocated_storage" {
  description = "Specifies the value for Storage Autoscaling"
  #type        = number
  default     = 100
}
variable "iam_database_authentication_enabled" {
  description = "Specifies whether or mappings of AWS Identity and Access Management (IAM) accounts to database accounts is enabled"
  #type        = bool
  default     = null
}
variable "vpc_name" {
  description = "Name to be used on all the resources as identifier"
  #type        = string
  default     = teja-vp-id
}
variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  #type        = bool
  default     = false
}
variable "iops" {
  description = "The name of iops"
  #type        = number
  default     = null
}
variable "publicly_accessible" {
  description = "Bool to control if instance is publicly accessible"
  #type        = bool
  default     = false
}
variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible"
  #type        = bool
  default     = false
}
variable "performance_insights_enabled" {
  description = "Specifies whether Performance Insights are enabled"
  #type        = bool
  default     = false
}
variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  #type        = bool
  default     = true
}
variable "apply_immediately" {
  description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
  #type        = bool
  default     = true
}
variable "maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'"
  type        = string
  default     = null
}
variable "skip_final_snapshot" {
  description = "The name of the skip-final-snapshot"
  #type        = bool
  default     = false
}
variable "backup_retention_period" {
  description = "The days to retain backups for"
  #type        = number
  default     = 7
}
variable "backup_window" {
  description = "The name of the backup-window"
  #type        = string
  default     = null
}
variable "character_set_name" {
  description = "The character set name "
  #type        = string
  default     = null
}
variable "deletion_protection" {
  description = "The database can't be deleted when this value is set to true."
  #type        = bool
  default     = false
}
variable "performance_insights_kms_key_id" {
  description = "The ARN for the KMS key to encrypt Performance Insights data."
  #type        = string
  default     = null
}
variable "final_snapshot_identifier" {
  description = "The name which is prefixed to the final snapshot on cluster destroy"
  #type        = string
  default     = null
}
variable "tags" {
  type = map(string)
  default = {
    #"name" = "value"
  }
}
variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN. If storage_encrypted is set to true and kms_key_id is not specified the default KMS key created in your account will be used"
  #type        = string
  default     = null
}
variable "region" {
  description = "region to deploy resource"
  default = asia-south-1
}
variable "account_id" {
  description = "aws account"
}
variable "description" {
  description = "Description"
  default = "subnet group for rds"
}
variable "family" {
  description = "The family of the DB parameter group"
  default = "docdb4.0"
}
variable "deployment_region" {
  description = "tag for region"
  type = string
  default = "asia-south-1"
}
# variable "account" {
#   type = number
#   description = "tag for aws acc"
#   default = "acc_id"
# }
variable "machine_type" {
  description = "tag for machine type"
  default = "rds"
}