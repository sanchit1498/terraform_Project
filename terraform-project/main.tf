module "dev_infra" {
  source         = "./my-module"
  instance_count = 3
  my_env         = "dev"
  instance_type  = "t2.micro"
  ami            = "ami-09040d770ffe2224f"

}

module "prd_infra" {
  source         = "./my-module"
  instance_count = 3
  my_env         = "prd"
  instance_type  = "t2.medium"
  ami            = "ami-09040d770ffe2224f"

}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "demo-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
