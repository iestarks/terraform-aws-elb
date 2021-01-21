variable "create_attachment" {
  description = "Create the elb attachment or not"
  type        = bool
  default     = true
}

variable "number_of_instances" {
  description = "Number of instances ID to place in the ELB pool"
  type        = number
}

variable "elbname" {
  description = "ELB Name"
  type        = string
  default = "http-80-elb"
}

variable "instances" {
  description = "List of instances ID to place in the ELB pool"
  type        = list(string)
}
