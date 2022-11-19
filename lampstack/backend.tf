terraform {
  backend "s3" {
    bucket = "ravidevops123"
    key    = "QA/terraform.tfstate"
    key    = "QA/terraform.tfstate.backup"
    region = "us-east-1"
  }
}
