variable "hostname" {
  description = "The hostname. For example 'workshop'"
}

variable "domain" {
  description = "The domain that has a corresponding wildcard cert in AWS ACM"
}

variable "vpc_cidr_block" {
  description = "The top-level CIDR block for the VPC."
  default     = "10.1.0.0/16"
}

variable "cidr_blocks" {
  description = "The CIDR blocks to create the workstations in."
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}

variable "cidr_blocks_priv" {
  description = "The CIDR blocks to create the workstations in."
  default     = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]
}

variable "owner" {
  description = "Owner information used in tags"
  default     = "ricardo"
}

variable "sleep-at-night" {
  description = "Tag used by reaper to identify resources that can be shutdown at night"
  default     = true
}

variable "TTL" {
  description = "Hours after which resource expires, used by reaper. Do not use any unit. -1 is infinite."
  default     = "240"
}
