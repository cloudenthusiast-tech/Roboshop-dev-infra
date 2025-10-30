variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "project_name" {
    type = string
    default = "roboshop"
}

variable "environment" {
    type = string
    default = "dev"
}

variable "public_subnet_cidrs" {
    type = list
    default = ["10.0.11.0/24","10.0.12.0/24"]
}

variable "private_subnet_cidrs" {
    type = list
    default = ["10.0.15.0/24","10.0.16.0/24"]
}

variable "database_subnet_cidrs" {
    type = list
    default = ["10.0.21.0/24","10.0.22.0/24"]
}

variable "is_peering_required" {
    type = bool
    default = false                                                                             
}