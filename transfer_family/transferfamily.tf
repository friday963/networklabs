/*
  This file is used to create a Transfer Family server and user
  The server is used to transfer files to and from the server
  The user is used to authenticate and transfer files to and from the server
*/
resource "aws_transfer_server" "network_logging_server" {
  # The endpoint type is set to PUBLIC, which means that the server can be accessed over the internet
  endpoint_type = "PUBLIC"
  # the protocols that are allowed to be used with the server, in this case only SFTP because its required over a public endpoint.
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
  home_directory = "${join("", ["/", aws_s3_bucket.example_bucket.id, "/", local.s3_folders[0], "/"])}"
  tags = {
    Name = var.project_tag
  }
}

