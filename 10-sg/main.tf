module "sg" {
    count= length(var.sg_names)
    source = "git::https://github.com/cloudenthusiast-tech/terraform-aws-sg.git?ref=main"
     project_name= var.project_name
     environment= var.environment
     sg_names= var.sg_names[count.index]
     sg_description= "created for ${var.sg_names[count.index]}"
     vpc_id= local.vpc_id

}