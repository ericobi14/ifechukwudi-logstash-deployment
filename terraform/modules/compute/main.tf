resource "aws_instance" "instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = var.name
  }
}

resource "aws_security_group" "instance" {
  name        = "${var.name}-sg"
  description = "Security group for ${var.name}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = contains(keys(ingress.value), "source") ? [ingress.value.source] : []
      security_groups = contains(keys(ingress.value), "source_sg") ? [ingress.value.source_sg] : []
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