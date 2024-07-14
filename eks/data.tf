data "aws_caller_identity" "current" {}

data "aws_instance" "ec2" {
  filter {
    name   = "tag:eks:nodegroup-name"
    values = ["NG-tech-challenge"]
  }

  depends_on = [aws_eks_node_group.node-group]
}

data "terraform_remote_state" "rds_state" {
  backend = "s3"

  config = {
    bucket = var.s3_bucket_name
    key    = "prod/terraform-postgres.tfstate"
    region = "us-east-1"
  }
}

locals {
  aws_vpc_id            = data.terraform_remote_state.rds_state.outputs.vpc_id
  aws_public_subnet_id  = data.terraform_remote_state.rds_state.outputs.public_subnet_id
  aws_public_subnet2_id = data.terraform_remote_state.rds_state.outputs.public_subnet2_id
  aws_private_subnet_id = data.terraform_remote_state.rds_state.outputs.private_subnet_id
  aws_rds_public_sg_id  = data.terraform_remote_state.rds_state.outputs.rds_public_sg_id
}
