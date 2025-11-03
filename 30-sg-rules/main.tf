
#backend_alb accepting traffic from bastion
resource "aws_security_group_rule" "backend_alb_bastion" {
    type = "ingress"
    security_group_id = local.backend_alb_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 80
    to_port = 80
    protocol = "tcp"
  
}