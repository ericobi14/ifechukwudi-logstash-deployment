variable "name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "vpc_id" {}

variable "ingress_rules" {
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    source_sg  = optional(string)
    source     = optional(string)
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
