locals {
  common_name_suffix="${var.project_name}-${var.environment}"
  
  common_tags={
    project_name= var.project_name
    environment= var.environment
    terraform= true
}
}


