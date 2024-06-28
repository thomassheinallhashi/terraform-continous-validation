check "ami_version_check" {
  data "aws_instance" "ubuntu3" {
    instance_tags = {
      Name = "ubuntu-456"
    }
  }

  assert {
    condition = aws_instance.ubuntu3.ami == data.hcp_packer_artifact.learn-packer-ubuntu.external_identifier
    error_message = "Must use the latest available AMI, ${data.hcp_packer_artifact.learn-packer-ubuntu.external_identifier}."
  }
}
