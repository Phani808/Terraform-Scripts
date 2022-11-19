resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "myvpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"

  tags = {
    "Name" = "Public subnet"
  }
}

resource "aws_security_group" "Instance_SG" {
  name        = "Instance-SG"
  description = "Traffic to EC2"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "instances aws security group"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    #cidr_blocks = [aws_vpc.main.cidr_block]
    cidr_blocks = ["0.0.0.0/0"]
  }
  
egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Instance-SG"
  }
}

resource "aws_instance" "awsvm" {
  count                  = 1
  ami                    = "ami-0aeeebd8d2ab47354"
  key_name               = "ravidevops"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Instance_SG.id]
  subnet_id              = aws_subnet.public.id
  tags = {
    Name = "TestEnv"
    }
}
