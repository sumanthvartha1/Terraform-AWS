output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {

  value = [

      aws_subnet.public_az1.id,

      aws_subnet.public_az2.id

  ]

}

output "private_subnet_id" {
  value = aws_subnet.private.id
}