resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["10.12.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  lifecycle { # Prevent recreation of security group on ingress/egress changes
    ignore_changes = [
      ingress,
      egress
    ]
  }

  tags = {
    Name = "allow_http-2"
  }
}