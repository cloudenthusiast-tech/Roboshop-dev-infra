
# backend_alb accepting traffic from bastion instance
resource "aws_security_group_rule" "backend_alb_bastion" {
    type = "ingress"
    security_group_id = local.backend_alb_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 80
    to_port = 80
    protocol = "tcp"
  
}


#ingress traffic from  laptop to bastion to
resource "aws_security_group_rule" "mongodb-bastion" {
    type = "ingress"
    security_group_id = local.bastion_sg_id
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    to_port = 22
    protocol = "tcp"
}

#ingress traffic from  bastion to mongodb
resource "aws_security_group_rule" "bastion-mongodb" {
    type = "ingress"
    security_group_id = local.mongodb_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 22
    to_port = 22
    protocol = "tcp"
}

#ingress traffic from  bastion to redis
resource "aws_security_group_rule" "bastion-redis" {
    type = "ingress"
    security_group_id = local.redis_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 22
    to_port = 22
    protocol = "tcp"
}


#ingress traffic from  bastion to rabbitmq
resource "aws_security_group_rule" "bastion-rabbitmq" {
    type = "ingress"
    security_group_id = local.rabbitmq_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 22
    to_port = 22
    protocol = "tcp"
}

#ingress traffic from  bastion to mysql
resource "aws_security_group_rule" "bastion-mysql" {
    type = "ingress"
    security_group_id = local.mysql_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 22
    to_port = 22
    protocol = "tcp"
}

#ingress traffic from  bastion to catalogue
resource "aws_security_group_rule" "bastion-catalogue" {
    type = "ingress"
    security_group_id = local.catalogue_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 22
    to_port = 22
    protocol = "tcp"
}

#mongodb accepting traffic from catalogue
resource "aws_security_group_rule" "mongodb-catalogue" {
    type = "ingress"
    security_group_id = local.mongodb_sg_id
    source_security_group_id = local.catalogue_sg_id
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
}