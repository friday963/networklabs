/* 
Create IAM role for "transfer family" service to assume, notice the "Service" in the Principal block.
This means that only the "transfer family" service can assume this role.
*/
resource "aws_iam_role" "transfer_role" {
  name = "transfer_family_role"
  tags = {
    Name = var.project_tag
  }
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "transfer.amazonaws.com"
        }
      }
    ]
  })
}

/* 
This policy will be attached to the role, and it will allow full access to S3.
Without this policy, the role will not be able to perform any action on S3.
In essense the role will be useless without this policy.
*/
resource "aws_iam_policy" "s3_full_access_policy" {
  name        = "s3_full_access_policy"
  description = "Policy for full access to S3 for transfer family role."

    tags = {
      Name = var.project_tag
    }
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:*",
        Effect   = "Allow",
        Resource = "*",
      }
    ]
  })
}
/* 
Here we attach the policy to the role.
If we don't do this, you essentially have two separate resources that are not connected.
*/
resource "aws_iam_role_policy_attachment" "s3_full_access_attachment" {
  policy_arn = aws_iam_policy.s3_full_access_policy.arn
  role       = aws_iam_role.transfer_role.name
}
