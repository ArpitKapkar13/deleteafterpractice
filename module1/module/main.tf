module "ec2" {
  source = "/home/rpit_k/deleteafterpractice/module1/main/Ec2"
  web_ami= "ami-068c0051b15cdb816"
  web_instance_type = "t3.micro"
  web_keys = "keys"
  wev_disable_api_termination = false
  web_subnetA = module.vpc.subnet_id
  web_security_group=module.vpc.webserver_sg
}

module "vpc" {
  source =  "/home/rpit_k/deleteafterpractice/module1/main/VPC"
  vpc_cidr = "10.0.0.0/16"
  vpc_subnetA = "172.30.128.0/20"
  public_ip = true
}

module "internetgateway" {
  source =  "/home/rpit_k/deleteafterpractice/module1/main/internetgateway"
  vpc_id=module.vpc.vpc_id
  public_subnet_id = module.vpc.subnet_id
}