variable "aws_region" {
  type = string
  # default = "us-east-1"
}
variable "IaC_key" {
  type    = string
  default = ""

}

variable "security_id" {
  type    = string
  default = ""

}

# variables below are unique to each instance
variable "instance_type_t2-micro" {
  type    = string
  default = "t2.micro"
}

variable "ami_ubuntu" {
  description = "AWS AMI ID"
  type        = string
  default     = ""
}

variable "ami_amazon_linux" {
  description = "AWS AMI ID"
  type        = string
  default     = ""
}

variable "volume_size_12GB" {
  type    = number
  default = 12
}

# Elizabeth values
variable "ami_centos" {
  description = "CentOS AMI ID"
  type        = string
  default     = ""
}

variable "volume_size_20GB" {
  type    = number
  default = 20
}
