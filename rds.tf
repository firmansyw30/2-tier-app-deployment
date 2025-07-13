module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "wordpress-db"

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "wordpress"
  username = "admin"
  password = "YourStrongPassword123!" # Ganti dengan password yang aman
  port     = 3306

  publicly_accessible = false

  vpc_security_group_ids = [aws_security_group.db_sg.id]

  # Gunakan private subnet dari module vpc
  subnet_ids = module.vpc.private_subnets

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

  # Tidak perlu IAM DB Auth, option group, parameter group, monitoring role
  iam_database_authentication_enabled = false
  create_db_option_group = false

  # Disable creation of parameter group - provide a parameter group or default to AWS default
  create_db_parameter_group = false
  create_monitoring_role = false
}