variable "region" {
  description = "AWS region"
  default = "us-east-2"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default = "Approved_Instance/Virtual_Machine"
}

variable "access_key" {
  description = " "
  default = ""
}

variable "secret_key" {
  description = " "
  default = " "
}

variable "session_token" {
  description = " "
  default = " "
}
