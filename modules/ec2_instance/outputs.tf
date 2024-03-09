output "instance_id" {
  description = "The ID of the launched EC2 instance"
  value       = aws_instance.ec2_instance.id
}

output "public_ip" {
  description = "The public IP address of the launched EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}
