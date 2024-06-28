provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
    token = var.session_token
}

provider "hcp" {
    client_id = "zyKs4ZUF0VCIgRCgOPYnbeTbY6bbrWcZ" 
    client_secret = "JkoCqFO4tizXPYDYXH2wdsu4YJ5Wq_kT02zPiwHtZbvGy0bBWg6niO6YjxldHe-W"    
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
  ami                         = data.hcp_packer_artifact.learn-packer-ubuntu.external_identifier
  instance_type               = var.instance_type

  tags = {
    Name = "ubuntu-instance"
  }
}

