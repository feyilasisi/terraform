provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform_backend" {
  bucket = "novac-terraform-state-storage"
  force_destroy = true

  lifecycle {
    prevent_destroy = true # to avoid accidental deletion of the bucket
  }

  tags = {
    Purpose = "Terraform State Storage"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_backend.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.terraform_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Purpose = "Terraform Locking Table"
  }
  lifecycle {
    prevent_destroy = true # to avoid accidental deletion of the table
  }
}


