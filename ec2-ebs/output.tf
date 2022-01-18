output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
}
output "EBS_id" {
  description = " EBS_volume ID"
  value = aws_ebs_volume.example.id
}

