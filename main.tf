# main.tf
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-08982f1c5bf93d976" # Amazon Linux 2023
  instance_type = "t3.micro"

  tags = {
    Name = "MyFirstEC2"
  }
}
