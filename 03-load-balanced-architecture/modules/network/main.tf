resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "payment-vpc"
  }     
  
}

resource "aws_subnet" "public_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1_cidr
  availability_zone       = "ap-south-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "payment-public-az1"
  }
}

resource "aws_subnet" "public_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet2_cidr
  availability_zone       = "ap-south-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "payment-public-az2"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr
  map_public_ip_on_launch = false

  tags = {
    Name = "payment-private-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "payment-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "payment-public-rt"
  }
}

resource "aws_route_table_association" "public_az1" {
  subnet_id      = aws_subnet.public_az1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_az2" {
  subnet_id      = aws_subnet.public_az2.id
  route_table_id = aws_route_table.public.id
}


moved {
  from = aws_route_table_association.public
  to   = aws_route_table_association.public_az1
}

moved {
  from = aws_route_table_association.public2
  to   = aws_route_table_association.public_az2
}