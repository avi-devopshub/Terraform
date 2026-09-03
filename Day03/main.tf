resource "aws_vpc" "dev_vpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "dev_vpc"
    }
}
resource "aws_subnet" "public_subnet"{
    vpc_id = aws_vpc.dev_vpc.id
    availability_zone = "ap-south-1a"
    cidr_block = "10.0.0.0/20"
    map_public_ip_on_launch = true
    tags = {
        Name = "public_subnet"
    }
}
resource "aws_subnet" "private_subnet"{
    vpc_id = aws_vpc.dev_vpc.id
    availability_zone = "ap-south-1b"
    cidr_block = "10.0.16.0/20"
    tags = {
        Name = "private_subnet"
    }
}
resource "aws_internet_gateway" "igw"{
    vpc_id = aws_vpc.dev_vpc.id
    tags = {
        Name = "igw"
    }
}
resource "aws_eip" "nat_eip"{
    domain = vpc
    tags = {
        Name = nat_eip
    }
}
resource "aws_nat_gateway" "nat"{
    allocation_id = aws_eip.nat_eip.id
    subnet_id = aws_subnet.public_subnet.id
    tags = {
        Name = "nat"
    }
}
resource "aws_route_table" "public_rt"{
    vpc_id = aws_vpc.dev_vpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }    
    tags = {
        Name = "public_rt"
    }
}
resource "aws_route_table" "private_rt"{
    vpc_id = aws_vpc.dev_vpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.nat.id
        }    
    tags = {
        Name = "private_rt"
    }
}

