locals {
  output_public_subnets = {
    for key in keys(local.public_subnet) : key => {
      subnet_id          = aws_subnet.this[key].id
      availaibility_zone = aws_subnet.this[key].availability_zone
    }

  }

  output_private_subnets = {
    for key in keys(local.private_subnet) : key => {
      subnet_id          = aws_subnet.this[key].id
      availaibility_zone = aws_subnet.this[key].availability_zone
    }

  }
}




output "public_subnet" {
  description = "The ID and the availability Zone of Public Subnets"
  value       = local.output_public_subnets
}

output "private_subnet" {
  description = "The ID and the availability Zone of private Subnets"
  value       = local.output_private_subnets
}

output "vpc_id" {
  description = "The AWS ID from the created VPC"
  value       = aws_vpc.this.id
}
