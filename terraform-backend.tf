terraform {
  backend "s3" {
    bucket  = "message-system-state-file"
    key     = "terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}