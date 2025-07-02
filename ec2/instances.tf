variable "vpc_id" {}
variable "public_subnet_id" {}
variable "private_subnet_id" {}
variable "key_name" {}
variable "public_sg_id" {}
variable "private_sg_id" {}

resource "aws_instance" "public_vm" {
  ami           = "ami-0c94855ba95c71c99" # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.public_sg_id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "PublicVM"
  }
}

resource "aws_instance" "private_vm" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  subnet_id     = var.private_subnet_id
  key_name      = var.key_name
  vpc_security_group_ids = [var.private_sg_id]

  tags = {
    Name = "PrivateVM"
  }
}
output "public_vm_public_ip" {
  value = aws_instance.public_vm.public_ip
}

