resource "aws_ssm_parameter" "db_host" {
  name  = "/${var.service_name}/db_host"
  value = aws_db_instance.default.address
  type  = "String"
}

resource "aws_ssm_parameter" "db_name" {
  name  = "/${var.service_name}/db_name"
  value = aws_db_instance.default.db_name
  type  = "String"
}

resource "aws_ssm_parameter" "db_username" {
  name  = "/${var.service_name}/db_username"
  value = aws_db_instance.default.username
  type  = "String"
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/${var.service_name}/db_password"
  value = aws_db_instance.default.password
  type  = "SecureString" # Important to store the password securely in SSM
}
