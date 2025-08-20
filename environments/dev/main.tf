
module "vpc" {
  source        = "../../modules/vpc"
  vpc_cidr      = "10.0.0.0/16"
  subnet_cidr   = "10.0.1.0/24"
  subnet_az     = "ap-southeast-1a"         # ap-southeast-1a
  env           = "dev"
}

module "ec2" {
  source            = "../../modules/ec2"
  ami_id            = "ami-02c7683e4ca3ebf58"
  instance_type     = "t2.medium"
  subnet_id         = module.vpc.subnet_id
  ec2_count         = 3
  env               = "dev"
}
