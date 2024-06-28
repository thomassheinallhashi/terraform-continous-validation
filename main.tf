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

check "ami_version_check" {
  data "aws_instance" "ubuntu" {
    instance_tags = {
      Name = "ubuntu-instance"
    }
  }

  assert {
    condition = aws_instance.ubuntu.ami == data.hcp_packer_artifact.learn-packer-ubuntu.external_identifier
    error_message = "Must use the latest available AMI, ${data.hcp_packer_artifact.hashiapp_image.external_identifier}."
  }
}


