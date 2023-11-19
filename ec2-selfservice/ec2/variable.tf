variable "sg_name" {
  description = "name of the security group"
  default = null
}
variable "user_data" {
  description = "The user data to provide when launching the instance."
  type = string
  default = null
}
variable "vpc_id" {
  description = " which vpc need to launch"
  default = null
}
variable "vpc_name" {
  description = "The name of the vpc_id"
  default = teja-vpc1
}
variable "ami" {
  description = "ami whichinstances need to launched"
  default = null
}
variable "instance_type" {
  description = "aws ec2 instance type to use"
}
variable "public_ip" {
  description = "valueaws public ip to use for instance"  
  default = null 
}
variable "key_name" {
  description = "aws keypair for instances"
  default = null
}
variable "region" {
  type = string
  description = "provider for region"
  default = "ap-south-1"
}
variable "account_id" {
  type = string
  description = "aws acc id"
}
variable "name" {
  description = "instance name"
  type = string
}
variable "account" {
  description = "the name of the acc"
  default = acc
}
variable "volume_size" {
  description = "tag for machin type"
  default = null
}