output "instance_id" {
  value = aws_instance.instance.id
}

output "security_group_id" {
  value = aws_security_group.instance.id
}