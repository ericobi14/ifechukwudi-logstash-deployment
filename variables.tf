
variable "region" {
  description = "The AWS region to deploy resources into"
  type        = string
}

variable "profile" {
  description = "The AWS CLI profile to use"
  type        = string
}

variable "module_source" {
  description = "Source for modules"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "logstash" {
  description = "Logstash specific settings"
  type        = map(string)
}

variable "admin_ip_for_ssh" {
  description = "The public IP address allowed to SSH into the bastion host"
  type        = string
}

variable "az_configurations" {
  description = "Availability Zone configurations (list of maps)"
  type        = list(object({
    az             = string
    public_subnet  = string
    private_subnet = string
  }))
}

variable "common_tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}

variable "ami_id" {
  description = "The AMI ID for EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "project_name" {
  type = string
}

variable "ingress_rules" {
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    source    = string
  }))
}

variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    destination = string
  }))
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  type        = string
}

variable "name" {
  description = "Name tag for resources"
  type        = string
}