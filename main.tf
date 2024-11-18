provider "aws" {
  region = "us-east-1" # اختر المنطقة التي تريد العمل عليها
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0c02fb55956c7d316" # Ubuntu AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id
  tags = {
    Name = "MyTerraformInstance"
  }
}

