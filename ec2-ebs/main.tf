terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
   profile= "default"
   region= "us-east-1"
}
resource "aws_instance" "example" {
   ami="ami-08e4e35cccc6189f4"
   instance_type="t2.micro"
   key_name = "aws-key"
   tags = {
     Name = "MyInstance"
   }
   vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}

resource "aws_ebs_volume" "example" {
   availability_zone = aws_instance.example.availability_zone
   size              = 40
   tags              = {
     Name = "MyEBS"
  }
}

resource "aws_volume_attachment" "ebs_att" {
   device_name = "/dev/sdd"
   volume_id   = aws_ebs_volume.example.id
   instance_id = aws_instance.example.id
}


