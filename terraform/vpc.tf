module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name = "vpc-time-service"
  cidr = "10.0.0.0/16"

  azs = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.0.0/20", "10.0.16.0/20"]
  private_subnets = ["10.0.32.0/20", "10.0.48.0/20"]

  enable_nat_gateway = true
  single_nat_gateway = true
}