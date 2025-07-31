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

variable "ingress_rules" {
  description = <<EOT
List of ingress rules with from_port, to_port, protocol, and either source or source_sg.
Only one of 'source' or 'source_sg' should be provided per rule. If both are provided, the configuration is invalid.
EOT

  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    source     = optional(string)
    source_sg  = optional(string)
  }))

  validation {
    condition = alltrue([
      for rule in var.ingress_rules : (
        !(contains(keys(rule), "source") && rule.source != null && contains(keys(rule), "source_sg") && rule.source_sg != null)
      )
    ])
    error_message = "Only one of 'source' or 'source_sg' can be set per ingress rule."
  }
}