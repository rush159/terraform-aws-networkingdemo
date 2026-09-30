locals {
  public_subnet = {
    for key, config in var.subnet_config : key => config if config.public
  }
  private_subnet = {
    for key, config in var.subnet_config : key => config if !config.public
  }
}