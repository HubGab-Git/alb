
variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "default region"
}

variable "instance_type" {
  type        = string
  default     = "t3.small"
  description = "Instance type for EKS nodes"
}
variable "subnets" {
  type        = list(string)
  default     = ["subnet-0ca31973b1de89bad", "subnet-0bd22b6dfb851cdbe", "subnet-01a5bb829e4355408"]
  description = "default subnets ids"
}
variable "vpc" {
  type        = string
  default     = "vpc-028137a4cde36edc8"
  description = "default vpc id"
}