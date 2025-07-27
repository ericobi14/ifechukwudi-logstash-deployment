
region = "eu-central-1"
profile = "ifechukwudi"
my_ip = "77.25.38.174/32"
project_name = "layered-staging"
common_tags = {
  Project     = "layered-staging"
  ManagedBy   = "Terraform"
  Environment = "Staging"
}
vpc_cidr = "10.1.0.0/16"
az_configurations = {
  "eu-central-1a" = {
    public_subnet_cidr  = "10.1.1.0/24"
    private_subnet_cidr = "10.1.2.0/24"
  },
  "eu-central-1b" = {
    public_subnet_cidr  = "10.1.3.0/24"
    private_subnet_cidr = "10.1.4.0/24"
  }
}

admin_ip_for_ssh = "77.25.38.174/32" 
ssh_allowed_ips = ["77.25.38.174/32"] 
instance_type = "t2.micro"
db_instance_class = "db.t3.micro"
allocated_storage = 20
database_name     = "layered_staging_db"
db_username       = "staginguser"
db_port           = 5432

