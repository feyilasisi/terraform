
terraform {
  backend "s3" {
    bucket         = "terraform-state-storage"
    key            = "terraform/EC2-state/terraform.tfstate" 
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
