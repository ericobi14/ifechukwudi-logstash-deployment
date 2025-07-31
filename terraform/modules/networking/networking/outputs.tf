output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

### Great wrok with outputs, but check were did yhou put those, you createad another compute folder inside compute, this happend also on your netwroking, fix those