provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

provider "hcp" {
    client_id = "o9g4FIlMe7TgilGmO4TIZzwFpcd7yXI4" 
    client_secret = "MdrAb-k7_qCYQmjEffzeZgQpBaMykEk7YGDUXk6hAOpPHRsm0IF2VLy8yMJhLx-x"    
}
data "hcp_packer_artifact" "learn-packer-ubuntu" {
  bucket_name   = "learn-packer-ubuntu"
  channel_name  = "latest"
  platform      = "aws"
  region        = "us-east-1"
}

data "hcp_packer_artifact" "learn-packer-ubuntudev" {
  bucket_name   = "learn-packer-ubuntu"
  channel_name  = "dev"
  platform      = "aws"
  region        = "us-east-1"
}


resource "aws_instance" "ubuntu" {
  ami                         = data.hcp_packer_artifact.learn-packer-ubuntudev.external_identifier
  instance_type               = var.instance_type

  tags = {
    Name = "ubuntu-789"
  }
}

