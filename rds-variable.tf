variable "identifier" {
    description = "Enter the name of our database which is unique in that region"
    default = "galaxy-g7"
}

variable "allocated_storage" {
    description = "Enter the storage of database"
    default = "250"
}

variable "storage_type" {
    description = "Put the type of storage you want"
    default = ""
}

variable "engine" {
    description = "Put your database engine you want eg. mysql"
    default = "oracle-ee"
}

variable "engine_version" {
    description = "Which version you want of your db engine"
    default = "19.0.0.0.ru-2021-01.rur-2021-01.r1"
}

variable "instance_class" {
    description = "Which type of instance you need like ram and cpu  eg. db.t2.micro"
    default = "db.m5.large"
}

variable "database_name" {
    description = "Enter your initial database name"
    default = "galaxy7"
}

variable "environment" {
    description = "your environment name"
    default = "dev"
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  default = ["subnet-0475b8ee0866ce514", "subnet-06fed82599ff539ab", "subnet-0641fdf173336da80"]
}

variable "vpc_id" {
  description      =  "put your vpc id"
  default = "vpc-04cbc1ac7a6211c6c"
}
