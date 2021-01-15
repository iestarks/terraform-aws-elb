######
# ELB
######
# module "elb" {
#   source = "./modules/elb"

#   create_elb = var.create_elb

#   name        = var.name
#   name_prefix = var.name_prefix

#   subnets         = var.subnets
#   security_groups = var.security_groups
#   internal        = var.internal

#   cross_zone_load_balancing   = var.cross_zone_load_balancing
#   idle_timeout                = var.idle_timeout
#   connection_draining         = var.connection_draining
#   connection_draining_timeout = var.connection_draining_timeout

#   listener     = var.listener
#   access_logs  = var.access_logs
#   health_check = var.health_check

#   tags = merge(
#     var.tags,
#     {
#       "Name" = format("%s", var.name)
#     },
#   )
# }
module "elb" {

 source = "./modules/elb"

  name = "elb-usbank"

  #subnets         = data.aws_subnet_ids.all.ids

  //Improve by automatically selecting the subnets per az

  #subnets  = ["subnet-0e20da1368e759895","subnet-0362a51a955d46f09"]
  security_groups = [data.aws_security_group.this.id]

  internal        = false

  listener = [
    {
      instance_port     = var.lb_port
      instance_protocol = "HTTP"
      lb_port           = var.lb_port
      lb_protocol       = "HTTP"
    },
    {
     instance_port     = var.instance_port
      instance_protocol = "http"
      lb_port           = var.lb_port
      lb_protocol       = "http"

      //Improvement run the modules for SSL cert generation and insert output here
      #ssl_certificate_id = "arn:aws:acm:eu-west-1:235367859451:certificate/6c270328-2cd5-4b2d-8dfd-ae8d0004ad31"
    },
  ]

  # health_check = {
  #   target              = var.target
  #   interval            = var.interval
  #   healthy_threshold   = var.healthy_threshold
  #   unhealthy_threshold = var.unhealthy_threshold
  #   timeout             = var.timeout
  # }

  # access_logs = {
  #   bucket = "usbank-bucket"
  # }

}


#################
# ELB attachment
#################
module "elb_attachment" {
  source = "./modules/elb_attachment"

  create_attachment = var.create_elb

  number_of_instances = var.number_of_instances

  elb   = module.elb.this_elb_id
  instances = var.instances
}
