output "vpc_id" {
  value = module.logstash.vpc_id
}

output "public_subnet_id" {
  value = module.logstash.public_subnet_id
}

output "private_subnet_id" {
  value = module.logstash.private_subnet_id
}
