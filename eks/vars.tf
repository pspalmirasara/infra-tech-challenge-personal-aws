variable "regionDefault" {
  default = "us-east-1"
}

variable "projectName" {
  default = "tech-challenge"
}

variable "instanceType" {
  default = "t3a.medium"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "s3_bucket_name" {
  default = "terraform-state-group-18" //TODO: create your S3 manually in aws
}
