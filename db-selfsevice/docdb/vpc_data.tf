data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "db_subnet_1" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name = "tag:Name"
    values = ["${var.vpc_name}-db1-ap1a"]
  } 
}

data "aws_subnet" "db_subnet_2" {
  vpc_id = data.aws_vpc.vpc.id
  filter {
    name = "tag:Name"
    values = ["${var.vpc_name}-db2-ap1b"]
  } 
}