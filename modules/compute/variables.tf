variable "name" {
  description = "The name of the EC2 instance and associated resources"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
}

variable "subnet_id" {
  description = "The subnet ID to launch the EC2 instance into"
}

variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
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
    source_sg  = optional(string)
    source     = optional(string)
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

variable "egress_rules" {
  description = "List of egress rules with from_port, to_port, protocol, and destination"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    destination = string
  }))
}
