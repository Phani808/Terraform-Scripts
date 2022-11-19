terraform {
  backend "s3" {
    bucket = "ravidevops123"
    key    = "QA/terraform.tfstate"
    region = "us-east-1"
  }
}
