resource "random_integer" "s3integrer" {
  min = 1000
  max = 9999
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "${join( "", ["network-logging-bucket-", random_integer.s3integrer.result])}"
  force_destroy = true
  tags = {
    Name = var.project_tag
  }
}

