
module "vpc" {
  source        = "../../modules/vpc"
  vpc_cidr      = "11.0.0.0/22"
  subnet_cidr   = "11.0.1.0/24"
  subnet_az     = "ap-southeast-1a"         # ap-southeast-1a
  env           = "qa"
}

module "ec2" {
  source            = "../../modules/ec2"
  ami_id            = "ami-02c7683e4ca3ebf58"
  instance_type     = "t2.large"
  subnet_id         = module.vpc.subnet_id
  ec2_count         = 2
  env               = "qa"
}
