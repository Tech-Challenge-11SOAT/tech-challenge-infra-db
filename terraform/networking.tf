# Puxa outputs do state do EKS
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "soat-terraform-states"   # mesmo bucket usado no infra-k8s
    key    = "eks/terraform.tfstate"   # chave exclusiva do state do EKS
    region = "us-east-1"
  }
}

# Subnet group do RDS usando subnets privadas do EKS
resource "aws_db_subnet_group" "rds_subnets" {
  name       = "${var.environment}-rds-subnet-group"
  subnet_ids = data.terraform_remote_state.eks.outputs.private_subnets

  tags = {
    Name = "${var.environment}-rds-subnet-group"
  }
}