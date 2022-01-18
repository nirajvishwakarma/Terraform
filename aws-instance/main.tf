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
  profile = "default"
  region  = "us-east-1"
}
resource "aws_instance" "app_server" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.medium"
  tags = {
    Name = var.instance_name
  }

resource "aws_ebs_volume" "exampleEBS" {
   availability_zone = "us-east-1b"
   size              = 40
}

resource "aws_valume_attachment" "ebs_att" {
   device_name = "/dev/sdh"
   volume_id   = aws_ebs_volume.exampleEBS.id
   instance_id = aws_instance.app_server.id
}
}


