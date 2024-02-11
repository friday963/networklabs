/* 
This is a random integer resource that will be used to generate a random number between 1000 and 9999.
*/
resource "random_integer" "s3integrer" {
  min = 1000
  max = 9999
}

/* 
Here we create the S3 bucket. But notice the use of the random_integer resource in the bucket name.
This is a good example of how to use the output of one resource as an input to another resource.
This will engerate a random number between 1000 and 9999 and append it to the bucket name.
*/
resource "aws_s3_bucket" "example_bucket" {
  bucket = "${join( "", ["network-logging-bucket-", random_integer.s3integrer.result])}"
  force_destroy = true
  tags = {
    Name = var.project_tag
  }
}

