/* 
Like many programming languages, the 'main' file is the entry point for Terraform configurations. 
I've only included the providers block in this file, but it's common to include other configuration blocks here as well.
*/

provider "aws" {
  region = "us-east-1"  
}

provider "random" {}

