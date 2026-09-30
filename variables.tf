variable "vpc_config" {
  type = object({
    cidr_block = string
    Name       = string
  })
  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "The CIDR block must contain a valid CIDR Block"
  }
}

variable "subnet_config" {
  type = map(object({
    cidr_block = string
    public     = optional(bool, false)
    az         = string
  }))

  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "Each cidr_block must be a valid IPv4 CIDR block (e.g. 10.0.1.0/24)."
  }

  # validation {
  #   condition = alltrue([
  #     for azs1 in values(var.subnet_config) : contains(["ap-south-1a","ap-south-1b","ap-south-1c"] , azs1.az)
  #   ])
  # #   error_message = "az must be one of: ap-south-1a, ap-south-1b, ap-south-1c."
  # }
}