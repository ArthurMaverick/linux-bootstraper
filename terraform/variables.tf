variable "prefix_name" {
  type        = string
  description = "prefix name"
  default     = "workstation"
}

variable "instance_type" {
  type        = string
  description = "instance type"
  default     = "t4.nano"
}

variable "max_price_spot" {
  type        = number
  description = "max price allowed"
  default     = 0.0031
}

variable "volume_size" {
  type        = number
  description = "ebs volume size"
  default     = 20
}

variable "key_name" {
  type        = string
  description = "ssh public key"
}