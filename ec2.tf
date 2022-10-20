terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
provider "aws" {
access_key= "AKIAZUXYAQ6GQBLGET4I"
secret_key= "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"
region="us-east-1"
}

resource "aws_instance" "Apache_Tomcat" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
key_name= "terraform"
vpc_security_group_ids      = ["${aws_security_group.web-server.id}"]
 user_data                   = "${file("tomcat.sh")}"
}

