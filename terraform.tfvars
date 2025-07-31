project_name       = "logstash"
region             = "eu-central-1"
profile            = "ifechukwudi"
name               = "logstash"
ami_id             = "ami-02003f9f0fde924ea"
instance_type      = "t2.micro"
vpc_cidr           = "172.31.0.0/16"

az_configurations = [
  {
    az                = "eu-central-1a"
    public_subnet     = "10.0.1.0/24"
    private_subnet    = "10.0.2.0/24"
  }
]

ingress_rules = [
  {
    from_port  = 22
    to_port    = 22
    protocol   = "tcp"
    source     = "77.25.38.174/32"
  }
]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    destination = "0.0.0.0/0"
  }
]

common_tags = {
  Project     = "logstash"
  ManagedBy   = "terraform"
  Environment = "dev"
}

admin_ip_for_ssh    = "203.0.113.10"
module_source       = "./modules"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
logstash = {
  key1 = "value1"
  key2 = "value2"
}