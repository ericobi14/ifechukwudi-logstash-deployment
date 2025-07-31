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
  description = "List of ingress rules with from_port, to_port, protocol, and source/source_sg"
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    source_sg  = optional(string)
    source     = optional(string)
  }))
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
