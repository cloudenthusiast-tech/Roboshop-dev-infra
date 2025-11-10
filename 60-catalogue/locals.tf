locals {
  common_name_suffix="${var.project_name}-${var.environment}"
  ami_id=data.aws_ami.devops_ami_id.id
  vpc_id=data.aws_ssm_parameter.vpc_id.value
  private_subnet_id=split("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
  private_subnet_ids=split("," , data.aws_ssm_parameter.private_subnet_ids.value)
  catalogue_sg_id=data.aws_ssm_parameter.catalogue_sg_id.value
  common_tags={
    project_name= var.project_name
    environment= var.environment
    terraform= true
}
}