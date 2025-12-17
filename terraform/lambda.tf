module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "simple-time-service"
  description   = "Basic service to view timestamp and IP address of the host"

  create_package = false

  image_uri    = "docker.io/sujay20092002/simple-time-service-application"
  package_type = "Image"

#  VPC
  vpc_subnet_ids = module.vpc.intra_subnets
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  attach_network_policy = true

#  API Gateway
  create_lambda_function_url = true
  authorization_type = "NONE"
}