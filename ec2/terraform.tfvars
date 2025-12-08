
# Do not change these values. 
# They are referenced in the main.tf file and such changes will break the code and trigger recreation/destruction of provisioned resources.
aws_region             = "us-east-1"
instance_type_t2-micro = "t2.micro"
ami_amazon_linux       = "ami-00ca32bbc84273381" # Ubuntu 24.04 OS
ami_ubuntu             = "ami-020cba7c55df1f615" # amazon Linux 2 AMI ID
IaC_key                = "IaC_key"
security_id            = "sg-0125bea61233b0fed" # web-server-SG security group ID
volume_size_12GB       = 12

# New values for Elizabeth instance
ami_centos             = "ami-00382358a9d3025e6" # amazon Linux 2 AMI ID
volume_size_20GB       = 20 #creating 20 GB for test

