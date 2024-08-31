provider "aws" {
  region = "eu-central-1" # Adjust to your region
}

# **VPC Creation**
resource "aws_vpc" "arrk_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "arrk-vpc"
  }
}

# **Subnet Creation**
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.arrk_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.arrk_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.arrk_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.arrk_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "eu-central-1b"

  tags = {
    Name = "private-subnet-2"
  }
}

# **Internet Gateway Creation**
resource "aws_internet_gateway" "arrk_igw" {
  vpc_id = aws_vpc.arrk_vpc.id

  tags = {
    Name = "arrk-igw"
  }
}

# **Route Table for Public Subnets**
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.arrk_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.arrk_igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_subnet_1_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_2_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}