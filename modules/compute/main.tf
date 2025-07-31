resource "aws_instance" "logstash" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  tags = {
    Name = var.name
  }
}

resource "aws_security_group" "logstash_sg" {
  name        = "${var.name}-sg"
  description = "Security group for Logstash EC2"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.source != null ? [ingress.value.source] : []
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

resource "aws_security_group_rule" "ingress" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.main.id

  cidr_blocks = each.value.source != null && each.value.source_sg == null ? [each.value.source] : []
  source_security_group_id = each.value.source_sg != null ? each.value.source_sg : null
}