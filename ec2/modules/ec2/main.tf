resource "aws_instance" "base-ec2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  # user_data = file("userdata.sh")
  vpc_security_group_ids = [var.security_id]
  key_name = var.key_name

  root_block_device {
    volume_size = var.volume_size        
    volume_type = "gp3"     
    delete_on_termination = true
  }

  tags = {
    # Name = "dev-ec2"
    Name = var.server_name
  }
  lifecycle { # Prevent recreation of server on tag changes
    ignore_changes = [
      tags
    ]
  }
}

# Allocate an Elastic IP to each newly created server
resource "aws_eip" "server_eip" {
  # vpc = true
  tags = {
    Name = "${var.server_name}-eip"
  }
}

# Associate Elastic IP with EC2 instance
resource "aws_eip_association" "server_eip_assoc" {
  instance_id   = aws_instance.base-ec2.id
  allocation_id = aws_eip.server_eip.id
}