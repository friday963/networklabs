resource "aws_transfer_server" "network_logging_server" {
  endpoint_type = "PUBLIC"
  protocols = [ "SFTP" ]
  force_destroy = true
  post_authentication_login_banner = "Welcome to your network logging server"
  identity_provider_type = "SERVICE_MANAGED"
  tags = {
    Name = var.project_tag
  }
}

resource "aws_transfer_user" "transfer_user" {
  server_id = aws_transfer_server.network_logging_server.id
  user_name = "transfer_user"
  role = aws_iam_role.transfer_role.arn
  tags = {
    Name = var.project_tag
  }
}

