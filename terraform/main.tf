#===============================================================================
#  VPC
#===============================================================================
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name           = format("%s-vpc", var.prefix_name)
  cidr           = "10.0.0.0/16"
  azs            = ["eu-west-1a"]
  public_subnets = ["10.0.101.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
  }
}
#===============================================================================
#  SECURITY GROUP
#===============================================================================
resource "aws_security_group" "ssh" {
  vpc_id = module.vpc.vpc_arn
  name   = format("%s-sg", var.prefix_name)

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
#===============================================================================
#  SPOT INSTANCE
#===============================================================================
data "aws_ami" "this" {
  most_recent = true
  owners      = ["amazon"]
  #   filter {
  #     name   = "architecture"
  #     values = ["arm64"]
  #   }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-arm64-gp2"]
  }
}

resource "aws_instance" "this" {
  ami                         = data.aws_ami.this.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = module.vpc.public_subnets[0]
  security_groups             = [aws_security_group.ssh.id]
  key_name                    = var.key_name

  instance_market_options {
    spot_options {
      max_price = var.max_price_spot
    }
  }

  ebs_block_device {
    delete_on_termination = true
    device_name           = format("%s-ebs", var.prefix_name)
    volume_size           = var.volume_size
  }

  tags = {
    Name = format("%s-spot", var.prefix_name)
  }
}
