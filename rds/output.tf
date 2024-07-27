output "rds_public_sg_id" {
  description = "RDS public security group ID"
  value       = aws_security_group.rds_public_sg.id
}