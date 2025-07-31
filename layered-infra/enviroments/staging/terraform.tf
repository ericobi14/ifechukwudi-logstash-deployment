variable "name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "vpc_id" {}
variable "ingress_rules" {}
variable "egress_rules" {}
### Not sure why yo uhave the layered-infra files in this project, yu should remove tehe fodler entirely
resource "aws_security_group" "this" {
  name   = "${var.name}-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = lookup(ingress.value, "source", null) != null ? [ingress.value.source] : null
      security_groups = lookup(ingress.value, "source_sg", null) != null ? [ingress.value.source_sg] : null
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = [egress.value.destination]
    }
  }
}

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  vpc_security_group_ids = [aws_security_group.this.id]

  tags = {
    Name = var.name
  }
}

output "security_group_id" {
  value = aws_security_group.this.id
}