variable "vpc_id" {
  description = "The ID of the VPC where the Internet Gateway will be created and attached."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet that will be associated with the public route table for internet access."
  type        = string
}
