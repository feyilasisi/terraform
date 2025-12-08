output "public_ip" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.base-ec2.public_ip
}

output "public_id" {
  description = "The public IP of the EC2 instance"
  value       = aws_instance.base-ec2.id
}

output "ec2_EIP" {
  description = "The Elastic IP of the EC2 instance"
  value       = aws_eip.server_eip.public_ip
}

output "server_name" {
  description = "The name tag of the EC2 instance"
  value       = aws_instance.base-ec2.tags["Name"]
}