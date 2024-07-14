resource "aws_security_group" "sg" {
  name        = "SG-${var.projectName}"
  description = "this security group was created to realize fiap tech challenge"
  vpc_id      = local.aws_vpc_id

  ingress {
    description = "All"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
