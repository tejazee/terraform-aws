
variable "region" {
  type = string
  description = "provider for region"
  default = "ap-south-1"
}
variable "account_id" {
  type = string
  description = "aws acc id"
}
variable "function_name" {
  description = "the name of the lambda function"
  type = string
}
variable "account" {
  description = "the name of the acc"
  default = acc
}
variable "architectures" {
  description = "architectures type"
  type = string
}
variable "runtime" {
  description = "lambda functions runtime"
  type = string
}
variable "env" {
  description = "the name of the env"
  type = string
}
variable "description" {
  description = "the name of the description"
  type = string
}
variable "create_role" {
  description = "create iam role"
  type = string
}