provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
    token = var.session_token
}

data "hcp_packer_artifact" "learn-packer-ubuntu" {
  bucket_name   = "learn-packer-ubuntu"
  channel_name  = "latest"
  platform      = "aws"
  region        = "us-east-2"
}

data "hcp_packer_artifact" "learn-packer-ubuntu2" {
  bucket_name   = "learn-packer-ubuntu2"
  channel_name  = "latest"
  platform      = "aws"
  region        = "us-east-2"
}


resource "aws_instance" "ubuntu" {
  ami                         = data.hcp_packer_artifact.learn-packer-ubuntu2.external_identifier
  instance_type               = var.instance_type

  tags = {
    Name = "ubuntu-instance"
  }
}

