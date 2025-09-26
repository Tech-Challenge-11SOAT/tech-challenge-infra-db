variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "db_name" {
  type    = string
  default = "techchallenge"
}

variable "db_username" {
  type    = string
  sensitive = true
}

variable "db_password" {
  type    = string
  sensitive = true
  
}

variable "db_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

variable "allowed_cidrs" {
  type = list(string)
  default = ["0.0.0.0/0"] 
}

variable "multi_az" {
  type    = bool
  default = false
}
