data "aws_availability_zones" "available" {
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.6.0"

  name                 = "vpc-eks-chapter"
  cidr                 = "10.9.0.0/16"
  azs                  = data.aws_availability_zones.available.names
  public_subnets       = ["10.9.4.0/24", "10.9.5.0/24", "10.9.6.0/24"]
  enable_dns_hostnames = true
}