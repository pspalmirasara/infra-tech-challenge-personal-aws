resource "aws_iam_role" "eks_role" {
  name = "eks_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "sts:AssumeRole"
        ],
        Principal = {
          Service = "eks.amazonaws.com"
        },
        Effect = "Allow"
      },
      {
        Action = [
          "sts:AssumeRole"
        ],
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Effect = "Allow"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "eks_cluster_policy" {
  name       = "eks_cluster_policy"
  roles      = [aws_iam_role.eks_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# AmazonEKSServicePolicy
resource "aws_iam_policy_attachment" "eks_service_policy" {
  name       = "eks_service_policy"
  roles      = [aws_iam_role.eks_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

# AmazonEKSVPCResourceController
resource "aws_iam_policy_attachment" "eks_vpc_policy" {
  name       = "eks_vpc_policy"
  roles      = [aws_iam_role.eks_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

resource "aws_iam_policy_attachment" "eks_worker_policy" {
  name       = "eks_worker_policy"
  roles      = [aws_iam_role.eks_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_policy_attachment" "ec2_container_policy" {
  name       = "ec2_container_policy"
  roles      = [aws_iam_role.eks_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_policy_attachment" "eks_cni_policy" {
  name       = "eks_cni_policy"
  roles      = [aws_iam_role.eks_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

}
