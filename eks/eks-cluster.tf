resource "aws_eks_cluster" "eks-cluster" {
  name     = var.projectName
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids         = [local.aws_public_subnet_id, local.aws_public_subnet2_id]
    security_group_ids = [aws_security_group.sg.id]
  }

  access_config {
    authentication_mode = var.accessConfig
  }

  depends_on = [
    aws_security_group.sg
  ]
}
