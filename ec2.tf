module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  ami = "ami-00d4162429c37e6d8"
  name = "single-instance"

  instance_type = "t2.micro"
  key_name      = "keypair-firmansyw30"
  monitoring    = false
  subnet_id     = module.vpc.public_subnets[0]

  user_data = file("user-data/setup.sh")

  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = true
  
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}