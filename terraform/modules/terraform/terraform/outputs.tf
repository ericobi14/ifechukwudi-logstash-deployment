output "vpc_id" {
  value = module.networking.vpc_id
}
output "public_subnet_id" {
  value = module.networking.public_subnet_id
}
output "private_subnet_id" {
  value = module.networking.private_subnet_id
}
output "bastion_id" {
  value = module.bastion.instance_id
}
output "logstash_id" {
  value = module.logstash.instance_id
}