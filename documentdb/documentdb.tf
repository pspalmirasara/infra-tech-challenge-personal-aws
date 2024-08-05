resource "aws_docdb_cluster" "mongodb" {
  cluster_identifier     = "mongodb-cluster"
  engine                 = "docdb"
  master_username        = var.order_document_db_username
  master_password        = var.order_document_db_password
  db_subnet_group_name   = aws_docdb_subnet_group.subng-mongodb.name
  vpc_security_group_ids = [aws_security_group.mongodb_public_sg.id]
  skip_final_snapshot    = true
}

resource "aws_docdb_cluster_instance" "mongodb-instance" {
  count              = 1
  identifier         = "mongodb-cluster-instance"
  cluster_identifier = aws_docdb_cluster.mongodb.id
  instance_class     = "db.t3.medium"
}