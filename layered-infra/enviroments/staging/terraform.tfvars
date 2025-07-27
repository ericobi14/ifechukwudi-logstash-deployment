name           = "logstash"
ami_id         = "ami-02003f9f0fde924ea"
instance_type  = "t2.micro"
subnet_id      = "subnet-xxxxxx"
vpc_id         = "vpc-xxxxxx"

ingress_rules = [
  {
    from_port  = 22
    to_port    = 22
    protocol   = "tcp"
    source_sg  = "sg-xxxxxx"
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
