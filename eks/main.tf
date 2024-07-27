terraform {
  backend "s3" {
    bucket = "terraform-state-fiap-group-18" //TODO: create your S3 manually in aws
    key    = "prod/terraform-eks.tfstate"
    region = "us-east-1"  
  }
}