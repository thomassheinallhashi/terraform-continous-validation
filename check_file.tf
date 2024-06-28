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
