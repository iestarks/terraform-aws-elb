
module "elb" {

 source = "./modules/elb"

  name = var.elbname

  security_groups = [data.aws_security_group.this.*.id]


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
# module "elb_attachment" {
#   source = "./modules/elb_attachment"

#   create_attachment = var.create_elb

#   number_of_instances = var.number_of_instances

#   elb   = module.elb.this_elb_id
#   instances = var.instances
# }
