
# VPC resource 
resource "aws_vpc" "tikitu-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "tikitu-vpc"
    }
}

# public subnet resouces configured with VPC and CIDR blocks
resource "aws_subnet" "private-subnet" {
    vpc_id = aws_vpc.tikitu-vpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
      name = "private-subnet"
    }
}

# private subnet resouces configured with VPC and CIDR blocks
resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.tikitu-vpc.id
    cidr_block = "10.0.2.0/24"
    tags = {
      name = "public-subnet"
    }
}

# internet gateway associated with vpc 
resource "aws_internet_gateway" "tikitu-igw" {
  vpc_id = aws_vpc.tikitu-vpc.id
  tags = {
    Name = "tikitu-igw"
  }
}
# route table to be associated with cidr_block and internet gateway
resource "aws_route_table" "tikitu-route-table" {
  vpc_id = aws_vpc.tikitu-vpc.id 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tikitu-igw.id 
  }
}

# route table( already associated with cidr blcok and internet gateway ) association with subnet 
resource "aws_route_table_association" "tikitu-rout-table-association" {
    route_table_id = aws_route_table.tikitu-route-table.id 
    subnet_id = aws_subnet.public-subnet.id
}