terraform {
  backend "s3" {
    bucket         = "terraform-state"
    dynamodb_table = "s3-terraform-state-lock"
    key            = "terraform-aws/rds/postgres/UPDATEENV/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
