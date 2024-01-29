output "ec2_id" {
  description = "ec2 id"
  value       = aws_instance.demo-ec2.id
  sensitive   = false
}