#-----------CUSTOM NETWORK CREATION#----------

#VPC CREATION
resource "aws_vpc" "cust" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name= "CUSTOM VPC"
  }
}

#INTERNET GATEWAY CREATION AND ATTACH TO VPC

resource "aws_internet_gateway" "cust_ig" {
  vpc_id = aws_vpc.cust.id
  tags = {
    name= "cust_ig"
  }
}

#CREATION OF SUBNETS

resource "aws_subnet" "public" {
vpc_id = aws_vpc.cust.id
availability_zone = "ap-south-1a"
cidr_block = "10.0.0.0/27"
tags = {
  name="PUB_SUB"
}
}

resource "aws_subnet" "private" {
vpc_id = aws_vpc.cust.id
availability_zone = "ap-south-1a"
cidr_block = "10.0.0.64/27"
tags = {
  name="PVT_SUB"
}
}
#ELASTIC IP ALLOCATION
resource "aws_eip" "nateip" {
  depends_on = [ aws_internet_gateway.cust_ig ]
  
}

#CREATION OF NAT GATEWAY
resource "aws_nat_gateway" "NAT" {
allocation_id = aws_eip.nateip.id
subnet_id = aws_subnet.public.id
tags = {
  name= "TF NAT"
}

}

#create route table and attch to NAT
resource "aws_route_table" "pvt_rt" {
  vpc_id = aws_vpc.cust.id
  route{
nat_gateway_id = aws_nat_gateway.NAT.id
cidr_block = "0.0.0.0/0"
  }
}

#SUBNET ASSOCIATION WITH PVT RT
resource "aws_route_table_association" "name" {
  route_table_id = aws_route_table.pvt_rt.id
   subnet_id = aws_subnet.private.id
}

#CREATION OF ROUTE TABLES AND ATTACH TO IG

resource "aws_route_table" "PUB_RT" {
  vpc_id = aws_vpc.cust.id
  route {
    gateway_id = aws_internet_gateway.cust_ig.id
    cidr_block = "0.0.0.0/0"
  }
}

#SUBNET ASSOCIATION TO ROUTE TABLE
resource "aws_route_table_association" "cust" {
    route_table_id = aws_route_table.PUB_RT.id
    subnet_id = aws_subnet.public.id
  
}

#CREATE SECURITY GROUP

resource "aws_security_group" "cust_sg" {
  name        = "cust_sg"
  vpc_id      = aws_vpc.cust.id
  tags = {
    Name = "cust_sg"
  }

 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  }