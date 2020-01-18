resource "aws_vpc" "vpc_devops" {
  cidr_block    = "10.0.0.0/16"

  tags = {
    Name        = "vpc_devops"
  }
}

resource "aws_internet_gateway" "igw_devops" {
  vpc_id        = aws_vpc.vpc_devops.id
}

resource "aws_route_table" "route_table" {
  vpc_id        = aws_vpc.vpc_devops.id
  route {
    cidr_block  = "0.0.0.0/0"
    gateway_id  = aws_internet_gateway.igw_devops.id
  }
}

resource "aws_main_route_table_association" "igw_route_table_assoc" {
  vpc_id          = aws_vpc.vpc_devops.id
  route_table_id  = aws_route_table.route_table.id
}

resource "aws_subnet" "sub_public_devops" {
  vpc_id                  = aws_vpc.vpc_devops.id
  cidr_block              = "10.0.1.0/20"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "sub_public_devops"
  }
}

resource "aws_security_group" "sg_devops" {
  name        = "sg_devops"
  vpc_id      = aws_vpc.vpc_devops.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "sg_devops"
  }
}

resource "aws_key_pair" "kp_devops" {
  key_name    = "kp_devops"
  public_key  = file(var.public_key_path)
}

data "aws_ami" "centos" {
  owners      = ["679593333241"]
  most_recent = true

  filter {
      name   = "name"
      values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }

  filter {
      name   = "architecture"
      values = ["x86_64"]
  }

  filter {
      name   = "root-device-type"
      values = ["ebs"]
  }
}

resource "aws_instance" "ec2_devops" {
  ami                         = data.aws_ami.centos.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.kp_devops.key_name
  subnet_id                   = aws_subnet.sub_public_devops.id
  vpc_security_group_ids      = [ aws_security_group.sg_devops.id ]
  associate_public_ip_address = true

  tags = {
    Name      = "ec2_devops"
  }
}

resource "aws_eip" "static_public_ip" {
  instance    = aws_instance.ec2_devops.id
  vpc         = true
  depends_on  = [ "aws_internet_gateway.igw_devops" ]
}

output "eip_public_ip_addr" {
  value       = aws_eip.static_public_ip.public_ip
}
